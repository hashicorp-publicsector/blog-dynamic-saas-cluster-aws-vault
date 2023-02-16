
#!/bin/bash
source ~/.bash_profile

export $(cd ../.. && terraform output | sed 's/\s*=\s*/=/g' | xargs)

echo "=========Updating Kubeconfig with cluster details========="
aws eks update-kubeconfig --name ${EKS_CLUSTER_NAME} --region ${AWS_REGION}

export VAULT_POD=$(kubectl -n ${VAULT_NS} get pods \
                  --selector='app.kubernetes.io/name=vault' \
                  -o jsonpath='{.items[0].metadata.name}')

# Allow Vault Pod to be provisioned and in Running state
sleep 10

# Initialize and unseal Vault
echo "=========Initializing and unsealing Vault Engine========="
export VAULT_KEYS=$(kubectl -n ${VAULT_NS} \
                    exec -i ${VAULT_POD} -c vault \
                    -- vault operator init)

export RECOVERY_KEYS=$(echo "$VAULT_KEYS" | \
                    grep -m3 "Recovery Key" | \
                    awk -F: '{print $2}' | \
                    xargs)

export ROOT_TOKEN=$(echo "$VAULT_KEYS" | \
                    grep "Initial Root Token" | \
                    awk -F: '{print $2}' | \
                    xargs)

echo "=========Creating VAULT_ROOT_TOKEN_${RANDOM_STRING} secret in AWS Secrets Manager========="
aws secretsmanager create-secret \
    --name VAULT_ROOT_TOKEN_${RANDOM_STRING} \
    --region ${AWS_REGION} \
    --secret-string ${ROOT_TOKEN}\
    --query ARN | \
    xargs

echo "=========Storing RECOVERY Keys in AWS Secrets Manager========="
RECOVERY_KEYS_ARR=(${RECOVERY_KEYS})
for INDEX in "${!RECOVERY_KEYS_ARR[@]}"
do
    KEY_INDEX=$(($INDEX + 1))
    aws secretsmanager create-secret \
    --name RECOVERY_KEY_${RANDOM_STRING}_${KEY_INDEX} \
    --region ${AWS_REGION} \
    --secret-string ${RECOVERY_KEYS_ARR[$INDEX]} \
    --query ARN | \
    xargs
done

export VAULT_TOKEN=$(aws secretsmanager get-secret-value \
                    --secret-id VAULT_ROOT_TOKEN_${RANDOM_STRING} \
                    --region ${AWS_REGION} \
                    --query SecretString \
                    | xargs)

# Enable AWS secrets engine & Approle Auth Method
echo "=========Enabling AWS secrets engine & Approle Auth Method========="
kubectl -n ${VAULT_NS} exec -i \
    ${VAULT_POD} -c vault \
    -- env VAULT_TOKEN=${VAULT_TOKEN} \
        /bin/sh -c \
        "vault secrets enable aws
         vault auth enable approle"
