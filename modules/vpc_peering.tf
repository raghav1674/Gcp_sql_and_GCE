variable "peering1_name"{}

variable "peering2_name"{}

resource "google_compute_network_peering" "dev-peering" {
  name         = var.peering1_name
  network      = google_compute_network.dev_vpc_network.id
  peer_network = google_compute_network.vpc_prod_name.id
}

resource "google_compute_network_peering" "prod-peering" {
  name         = var.peering2_name
  network      = google_compute_network.vpc_prod_name.id
  peer_network = google_compute_network.dev_vpc_network.id
}
