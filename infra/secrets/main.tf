# This file creates secrets in the AWS Secret Manager
# Note that this does not contain any actual secret values
# make sure to not commit any secret values to git!
# you could put them in secrets.tfvars which is in .gitignore

data "aws_secretsmanager_secret_version" "db_pass" {
  secret_id = "arn:aws:secretsmanager:ap-south-1:645406807036:secret:db_pass-hTPyDb"
}

