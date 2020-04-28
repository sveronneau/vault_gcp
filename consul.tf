resource "google_compute_instance" "consul" {
  count        = "3"
  project      = var.project
  zone         = var.zone
  name         = "consul-node-${count.index}"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "ubuntu-1804-lts"
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
    subnetwork    = "consul-subnet-nane1"

    #access_config { //commenting this section will remove private IP assignment
    #  // Ephemeral IP
    #}
  }

  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }
  
  depends_on = [google_compute_subnetwork.consul_subnet_nane1]
  depends_on = [google_compute_instance.vault]
}
