resource "google_compute_network" "vault-custom-vpc" {
  name                    = "vault-vpc"
  description             = "Vault VPC"
  auto_create_subnetworks = "false"
  project                 = var.project
}

resource "google_compute_subnetwork" "vault-vpc-subnetwork" {
  name          = "vault-subnet-nane1"
  description   = "Vault Subnet"
  ip_cidr_range = "10.0.0.0/16"
  network       = "google_compute_network.vault-custom-vpc.self_link"
  region        = "northamerica-northeast1"
  project       = var.project
}

resource "google_compute_firewall" "vault-vpc-firewall" {
  name    = "vault-vpc-firewall"
  network = "vault-vpc"
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
