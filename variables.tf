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
  default = "northamerica-northeast1-c" 
}

variable "instance_count" {
  default = "3" 
}

variable "bastion_vpc" {
  default = "sandbox-tj4h-vpc1" 
}

variable "bastion_vpc_subnet" {
  default = "sandbox-tj4h-vpc1-sn1" 
}

variable "vault_vpc" {
  default = "vault-vpc" 
}

variable "vault_vpc_subnet" {
  default = "vault-subnet-nane1" 
}

variable "vault_vpc_subnet_cidr" {
  default = "10.0.1.0/24" 
}

variable "vault_vpc_subnet_ilb_cidr" {
  default = "10.0.3.0/26" 
}

variable "vault_node_machine_type" {
  default = "f1-micro" 
}

variable "vault_node_image" {
  default = "ubuntu-2004-lts" 
}
