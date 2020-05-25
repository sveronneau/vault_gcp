resource "google_compute_instance" "bastion" {
  project      = var.project
  zone         = var.zone
  name         = "vault-bastion"
  machine_type = "f1-micro"
  
  tags = ["vault"]
  
  boot_disk {
    initialize_params {
      image = "ubuntu-2004-lts"
    }
  }

  provisioner "local-exec" {
    command = "wget https://releases.hashicorp.com/vault/1.4.2/vault_1.4.2_linux_amd64.zip ; apt-get install update -y ; sudo apt-get install unzip -y; unzip vault_1.4.2_linux_amd64.zip"
    }

  network_interface {
    network       = "default"

    #access_config { //commenting this section will remove private IP assignment
    #  // Ephemeral IP
    #}
  }

  network_interface {
    subnetwork    = "vault-subnet-nane1"

    #access_config { //commenting this section will remove private IP assignment
    #  // Ephemeral IP
    #}
  }

  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }
  
  depends_on = [google_compute_subnetwork.vault_subnet_nane1]
}
