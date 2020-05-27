# vault_gcp
Terraform code to deploy a Vault 1.4 Cluster in GCP.

The image used is coming from a Cloud Build pipeline that uses Packer to build the Golden Image.

https://github.com/sveronneau/cloudbuild-packer-container

This requires a GCP Service Account for proper projects rights.

Please adapt variables.tf but also bastion.tf (if you want to change Vault Client installed on bastion node)

# CLOUD NAT
This deployment requires Cloud NAT to be enabled and linked to the Vault VPC to allow Cloud Auto-Unseal to work.  This needs to be done POST deployment.
