// dev

variable "vpc_name"{}

variable "gcp_project_id"{}

variable "subnet_name"{}

variable "gcp_subnet_region"{}


variable "gcp_subnet_ip_cidr_range"{}

variable "gcp_firewall"{}


variable "gcp_protocols_allowed"{}


variable "gcp_ports_over_tcp"{}


// prod 

variable "vpc_prod_name"{}


variable "subnet_prod_name"{}

variable "gcp_prod_subnet_region"{}


variable "gcp_prod_subnet_ip_cidr_range"{}

variable "gcp_prod_firewall"{}


variable "gcp_prod_protocols_allowed"{}

variable "gcp_prod_ports_over_tcp"{}




// creating  a  DEV VPC

resource "google_compute_network" "dev_vpc_network" {
  name =  var.vpc_name
  auto_create_subnetworks=false
  project= var.gcp_project_id

}


// create a subnetwork

resource "google_compute_subnetwork" "dev-network" {
  name          = var.subnet_name
  ip_cidr_range = var.gcp_subnet_ip_cidr_range
  region        = var.gcp_subnet_region
  network       = google_compute_network.dev_vpc_network.id

}


// create a firewall

resource "google_compute_firewall" "default" {
  name    = var.gcp_firewall
  network = google_compute_network.dev_vpc_network.name

  allow {
    protocol = var.gcp_protocols_allowed
  }

  allow {
    protocol = "tcp"
    ports    = var.gcp_ports_over_tcp
  }
}




// creating a prod vpc

resource "google_compute_network" "vpc_prod_name" {
  name =  var.vpc_prod_name
  auto_create_subnetworks=false
  project= var.gcp_project_id

}


// create a subnetwork

resource "google_compute_subnetwork" "subnet_prod_name" {
  name          = var.subnet_prod_name
  ip_cidr_range = var.gcp_prod_subnet_ip_cidr_range
  region        = var.gcp_prod_subnet_region
  network       = google_compute_network.vpc_prod_name.id

}


// create a firewall

resource "google_compute_firewall" "gcp_prod_firewall" {
  name    = var.gcp_prod_firewall
  network = google_compute_network.vpc_prod_name.name

  allow {
    protocol = var.gcp_prod_protocols_allowed
  }

  allow {
    protocol = "tcp"
    ports    = var.gcp_prod_ports_over_tcp
  }
}



