resource "google_compute_attached_disk" "vault" {
  count      = var.instance_count
  project    = var.project
  zone       = var.zone  
  disk       = "vault-data-${count.index}"  
  instance   = "vault-${count.index}"    
  depends_on = [google_compute_disk.vault]
}

resource "google_compute_instance" "vault" {
  count        = var.instance_count
  project      = var.project
  zone         = var.zone
  name         = "vault-${count.index}"
  machine_type = var.vault_node_machine_type

  tags = ["vault"]
  
  boot_disk {
    initialize_params {
      image = "vault14"
    }
  }
 
  network_interface {
    subnetwork    = var.vault_vpc_subnet
  }

  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }
  
  depends_on = [google_compute_subnetwork.vault_subnet_nane1]
  
  lifecycle {
    ignore_changes = [attached_disk]
  }
  
  metadata_startup_script = file("./startup-script.sh")
}

resource "google_compute_disk" "vault" {
  count      = var.instance_count
  project    = var.project
  zone       = var.zone
  name       = "vault-data-${count.index}"
  type       = "pd-ssd"
  size       = "150"
  depends_on = [google_compute_instance.vault]
}

output "ip" {
  value = google_compute_address.vm_static_ip.address
}
