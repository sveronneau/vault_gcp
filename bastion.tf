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
 
  network_interface {
    subnetwork    = var.bastion_vpc_subnet
    
    access_config { //commenting this section will remove private IP assignment
    #  // Ephemeral IP
    }
  }    

    #access_config { //commenting this section will remove private IP assignment
    #  // Ephemeral IP
    #}
  #}

  metadata_startup_script = "apt update -y ; apt upgrade -y ; apt install unzip wget -y ; wget -P /tmp/ https://releases.hashicorp.com/vault/1.4.2/vault_1.4.2_linux_amd64.zip ; unzip /tmp/vault_1.4.2_linux_amd64.zip -d /usr/local/bin ; rm -f /tmp/vault_1.4.2_linux_amd64.zip"
  
  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }
  
  depends_on = [google_compute_subnetwork.vault_subnet_nane1]
}

output "bastion_name" {
  value = google_compute_instance.bastion.name
}
