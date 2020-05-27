variable "credentials" {
  default = "" 
}

variable "project" {
  default = "" 
}

variable "region" {
  default = "northamerica-northeast1" 
}

variable "zone" {
  default = "northamerica-northeast1-b" 
}

variable "instance_count" {
  default = "3" 
}

variable "bastion_vpc" {
  default = "default" 
}

variable "vault_vpc" {
  default = "vault-vpc" 
}

variable "vault_vpc_subnet" {
  default = "vault-subnet-nane1" 
}
