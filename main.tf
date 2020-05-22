provider "google" {
  credentials = var.credentials
  project = var.project
  region  = var.region
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
  region        = "northamerica-northeast1"
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
