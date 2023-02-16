#!/bin/bash
source ~/.bash_profile

export $(cd ../.. && terraform output | sed 's/\s*=\s*/=/g' | xargs)

echo "=========Deleting Vault Root Token and Recovery Keys from Secrets Manager========="
export SECRETS=$(aws secretsmanager list-secrets --region ${AWS_REGION} \
                --query 'SecretList[?starts_with(Name, `RECOVERY_KEY_${RANDOM_STRING}_`) == `true` 
                                  || starts_with(Name, `VAULT_ROOT_TOKEN_${RANDOM_STRING}`) == `true`].Name' \
                --output text | xargs
                )
for SECRET in ${SECRETS}
do
    aws secretsmanager delete-secret \
        --secret-id ${SECRET} \
        --force-delete-without-recovery
done


echo "=========Removing kubectl alias from .bash_profile========="
sed -i '/alias k=kubectl/d' ~/.bash_profile

echo "=========Removing pooled tenant config folder========="
rm -rf ../config