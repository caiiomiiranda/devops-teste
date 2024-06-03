#Exit if output is different from 0
set -e

#Terraform Init
terraform init

#Terraform Apply
terraform apply -auto-approve \
  -var "private_key=$SSH_PRIVATE_KEY" \
  -var "aws_access_key=$AWS_ACCESS_KEY_ID" \
  -var "aws_secret_key=$AWS_SECRET_ACCESS_KEY" \
  -var "key_name=$AWS_KEY_NAME"