# Path: versions.tf

terraform {
  required_providers {
    netbox = {
      source = "e-breuninger/netbox"
      version = "2.0.7"
    }
    http = {
      source = "hashicorp/http"
      version = "3.2.0"
    }
  }
}
