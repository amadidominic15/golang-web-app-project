#!/bin/bash
set -e

# Check TERRAFORM_ACTION
if [ "$TERRAFORM_ACTION" != "apply" ] && [ "$TERRAFORM_ACTION" != "destroy" ]; then
  echo "action=none" >> "$GITHUB_OUTPUT"
  echo "TERRAFORM_ACTION is neither 'apply' nor 'destroy'. Exiting..."
  exit 0
fi

# Initialize Terraform
terraform init
terraform validate
terraform plan

# Apply or Destroy
if [ "$TERRAFORM_ACTION" = "apply" ]; then
  terraform apply -auto-approve
  echo "action=apply" >> "$GITHUB_OUTPUT"
elif [ "$TERRAFORM_ACTION" = "destroy" ]; then
  terraform destroy -auto-approve
  echo "action=destroy" >> "$GITHUB_OUTPUT"
fi
