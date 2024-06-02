#Exit if output is different from 0
set -e

#Terraform Init
terraform init

#Terraform Plan
terraform plan

#Terraform Apply
terraform apply -auto-approve \
  -var "private_key_path=$HOME/.ssh/id_rsa" \
  -var "aws_access_key=$AWS_ACCESS_KEY_ID" \
  -var "aws_secret_key=$AWS_SECRET_ACCESS_KEY"