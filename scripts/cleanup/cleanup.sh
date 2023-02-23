#!/bin/bash
source ~/.bash_profile

export $(cd ../../deployment/infra/ && terraform output | sed 's/\s*=\s*/=/g' | xargs)

echo "=========Deleting Vault Root Token and Recovery Keys from Secrets Manager========="
export SECRETS=$(aws secretsmanager list-secrets --region ${AWS_REGION} --output json | jq --arg rand "$RANDOM_STRING" -r '.SecretList[] | select(.Name | contains($rand)) | .Name' | xargs)

for SECRET in ${SECRETS}
do
    aws secretsmanager delete-secret \
        --secret-id ${SECRET} \
        --region ${AWS_REGION} \
        --force-delete-without-recovery
done


echo "=========Removing kubectl alias from .bash_profile========="
sed -i '/alias k=kubectl/d' ~/.bash_profile

echo "=========Removing pooled tenant config folder========="
rm -rf ../config
