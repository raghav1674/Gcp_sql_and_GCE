

variable "gcp_current_region"{

   default="asia-south1"


}


variable "gcp_credentials_path"{


    default="C:\\Users\\Raghav Gupta\\AppData\\Roaming\\gcloud\\application_default_credentials.json"
}


variable "gcp_project_id"{

    default="ordinal-tower-287507"
}



// DEV VPC


variable "vpc_name"{

    default="dev-vpc-network"
}



variable "subnet_name"{

    default="dev-subnetwork"
}

variable "gcp_subnet_region"{

    default="asia-southeast1"
}


variable "gcp_subnet_ip_cidr_range"{

    default="10.0.1.0/24"
}

variable "gcp_firewall"{

    default="allow-ssh-ping-http"

}


variable "gcp_protocols_allowed"{


   default="icmp"

}



variable "gcp_ports_over_tcp"{
   
    type=list
    default=["80", "22"]
}



// PROD VPC

variable "vpc_prod_name"{

    default="prod-vpc-network"
}


variable "subnet_prod_name"{

    default="prod-subnetwork"
}

variable "gcp_prod_subnet_region"{

    default="us-east1"
}


variable "gcp_prod_subnet_ip_cidr_range"{

    default="10.0.2.0/24"
}

variable "gcp_prod_firewall"{

    default="allow-all"

}


variable "gcp_prod_protocols_allowed"{


   default="icmp"

}


variable "gcp_prod_ports_over_tcp"{

    type="list"
    default=["0-65535"]
}

// peering 

variable "peering1_name"{


    default="dev-peering"
}


variable "peering2_name"{


    default="prod-peering"
}

// GCE 

variable "google_container_cluster_name"{

    default="wp-cluster"
}

variable "google_container_cluster_location"{

    default="asia-southeast1"
}

variable "google_container_cluster_node_count"{

    default=1
}

variable "google_container_cluster_node_machine_type"{

    default="n1-standard-1"
}
