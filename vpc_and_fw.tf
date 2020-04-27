resource "google_compute_network" "custom1" {
  name                    = "vault-vpc"
  description             = "Vault VPC"
  auto_create_subnetworks = "false"
  project                 = var.project
}

resource "google_compute_subnetwork" "custom1" {  
  name          = "vault-subnet-nane1"
  description   = "Vault Subnet"
  ip_cidr_range = "10.0.0.0/16"
  network       = "google_compute_network.custom1.self_link"
  region        = "northamerica-northeast1"
  project       = var.project
}

resource "google_compute_firewall" "custom1" {
  name    = "vault-vpc-firewall"
  network = "google_compute_network.custom1.self_link"
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
