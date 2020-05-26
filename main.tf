provider "google" {
  credentials = var.credentials
  project = var.project
  region  = var.region
}

# Locks the version of Terraform for this particular use case
terraform {
  required_version = "~>0.12.0"
}

resource "google_compute_network" "vault-vpc" {
  name                    = "vault-vpc"
  description             = "Vault VPC"
  auto_create_subnetworks = "false"
  project                 = var.project
}

resource "google_compute_subnetwork" "vault_subnet_nane1" {  
  name          = "vault-subnet-nane1"
  description   = "Vault Subnet"
  ip_cidr_range = "10.0.1.0/24"
  network       = google_compute_network.vault-vpc.self_link
  region        = "northamerica-northeast1"
  project       = var.project
}

resource "google_compute_subnetwork" "vault_reserved_ilb_subnet_nane1" {  
  name          = "vault-reserved-ilb-subnet-nane1"
  description   = "Vault Reserved ILB Subnet"
  ip_cidr_range = "10.0.3.0/26"
  network       = google_compute_network.vault-vpc.self_link
  region        = var.region
  project       = var.project
}

resource "google_compute_firewall" "vault-vpc-fw" {
  name    = "vault-vpc-firewall"
  network = google_compute_network.vault-vpc.self_link
  project = var.project

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22", "8200", "8201"]
  }
  
  source_tags = ["vault"]
}

resource "google_compute_firewall" "vault-vpc-fw-iap" {
  name    = "vault-vpc-firewall-iap"
  network = google_compute_network.vault-vpc.self_link
  project = var.project

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  
  source_ranges = ["35.235.240.0/20"]
}

resource "google_compute_instance_group" "vault-umig" {
  name        = "vault-umig"
  description = "Vault unmanaged instance group"
  zone        = var.zone
  network     = google_compute_network.vault-vpc.self_link
  count       = var.instance_count
  
  named_port {
    name = "vault-http"
    port = "8200"
  }

  named_port {
    name = "vault-https"
    port = "8201"
  }
  
  lifecycle {
    create_before_destroy = true
  }
}
