# vault_gcp
Terraform code to deploy a Vault 1.4 Cluster in GCP.

The image used is coming from a Cloud Build pipeline that uses Packer to build the Golden Image.

https://github.com/sveronneau/cloudbuild-packer-container

This requires a GCP Service Account for proper projects rights.
