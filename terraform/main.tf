provider "google" {
  project = "goolps-324202"
  region  = "us-central1"
  zone    = "us-central1-c"
}

resource "google_compute_instance" "vm_instance" {
  name         = "terraform-instance"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image    = "ubuntu-os-cloud/ubuntu-2004-lts"
    }
  }

  tags=["http"]

  network_interface {
    network    = "default"

    access_config {
      
    }
  }
}

resource "google_compute_instance" "frontend" {
  name         = "terraform-front-instance"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image    = "ubuntu-os-cloud/ubuntu-2004-lts"
    }
  }

  tags=["http"]

  network_interface {
    network    = "default"

    access_config {
      
    }
  }
}

resource "google_compute_firewall" "allow-http" {
  name = "goolps-allow-http"
  network = "default"
  allow {
    protocol = "tcp"
    ports = ["80", "8080", "8081", "3000"]
  }
}
