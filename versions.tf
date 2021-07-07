terraform {
  required_version = ">=0.15"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 3.60.0"
    }

    docker = {
      source  = "kreuzwerker/docker"
      version = "2.12.2"
    }

  }
}

provider "google" {
  region  = var.region
  project = var.project_id
}

data "google_client_config" "default" {}

provider "docker" {
  registry_auth {
    address  = "gcr.io"
    username = "oauth2accesstoken"
    password = data.google_client_config.default.access_token
  }
}
