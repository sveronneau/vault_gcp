Quick pipeline to make a golden Debian image via Packer (binary stored in gcr.io)

PACKER IMAGE

To use Packer from Google Cloud Build, you need to build an image with Packer installed. 

Clone this repo:<br>
$ git https://github.com/sveronneau/vault_gcp

Go to the directory that has the source code for the packer Docker image:<br>
$ cd vault_gcp/packer

Build the Docker image via Cloud Build:<br>
$ gcloud builds submit --config cloudbuild.yaml .
