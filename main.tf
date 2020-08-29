// provider google : command: gcloud auth application-default login
provider "google" {
  credentials = file(var.gcp_credentials_path)
  project     = var.gcp_project_id
  region      = var.gcp_current_region
}



module "gcp"{


 source="./modules"

// GCP VPC SUBNET FIREWALL AND GCE

gcp_project_id=var.gcp_project_id


// dev

vpc_name=var.vpc_name

subnet_name=var.subnet_name

gcp_subnet_region=var.gcp_subnet_region

gcp_subnet_ip_cidr_range=var.gcp_subnet_ip_cidr_range

gcp_firewall=var.gcp_firewall

gcp_protocols_allowed=var.gcp_protocols_allowed

gcp_ports_over_tcp=var.gcp_ports_over_tcp



// prod

vpc_prod_name=var.vpc_prod_name

subnet_prod_name=var.subnet_prod_name

gcp_prod_subnet_region=var.gcp_prod_subnet_region

gcp_prod_subnet_ip_cidr_range=var.gcp_prod_subnet_ip_cidr_range

gcp_prod_firewall=var.gcp_prod_firewall

gcp_prod_protocols_allowed=var.gcp_prod_protocols_allowed

gcp_prod_ports_over_tcp=var.gcp_prod_ports_over_tcp


// vpc peering


peering1_name=var.peering1_name

peering2_name=var.peering2_name

// dev gce



google_container_cluster_name=var.google_container_cluster_name

google_container_cluster_location=var.google_container_cluster_location

google_container_cluster_node_count=var.google_container_cluster_node_count

google_container_cluster_node_machine_type=var.google_container_cluster_node_machine_type



}
