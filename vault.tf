resource "google_compute_attached_disk" "vault" {
  count    = "3"
  disk     = "vault-data-${count.index}"  
  instance = "vault-${count.index}"  
}

resource "google_compute_instance" "vault" {
  count        = "3"
  project      = var.project
  zone         = var.zone
  name         = "vault-${count.index}"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "vault14"
    }
  }
 
# This is where we configure the instance with ansible-playbook
  #provisioner "local-exec" {
  #  command = "sleep 90; ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u your_sshkey_user --private-key your_private_key -i '${google_compute_instance.ansible.network_interface.0.access_config.0.assigned_nat_ip}', master.yml"
  #  }

  #network_interface {
  #  network       = "default"

    #access_config { //commenting this section will remove private IP assignment
    #  // Ephemeral IP
    #}
  #}

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
  
  lifecycle {
    ignore_changes = [attached_disk]
  }
}

resource "google_compute_disk" "vault" {
  count   = "3"
  project = var.project
  zone    = var.zone
  name    = "vault-data-${count.index}"
  type    = "pd-ssd"
  size    = "150"
}
