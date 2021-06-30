terraform {
  required_version = ">=0.15"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 3.60.0"
    }
  }
}

provider "google" {
  region  = var.region
  project = var.project_id
}

variable "region" {
  description = "Region in which resources are created"
  type        = string
  default     = "us-central1"
}

variable "node_env" {
  description = "Environment for the nodejs service"
  type        = string
  default     = "development"
}

variable "service_name" {
  description = "Name of the cloud run service"
  type        = string
  default     = "node-service"
}

variable "project_id" {
  description = "ID of the Google Cloud Project"
  type        = string
  default     = "nx-tf-tutorial"
}

variable "container_image" {
  description = "URL of the container image"
  type        = string
  default     = "marketplace.gcr.io/google/nginx:1.15"
}

variable "cpu_limit" {
  description = "Maximum amount of CPUs needed"
  type        = number
  default     = 1
}

variable "memory_limit" {
  description = "Maximum amount of memory needed"
  type        = string
  default     = "256Mi"
}

variable "container_port" {
  description = "Port which to listen on"
  type        = number
  default     = 80
}

variable "max_scale" {
  description = "Maximum number of instances of the service to scale"
  type        = number
  default     = 5
}

variable "container_concurrency" {
  description = "Maximum number of conncurent connections allowed to the service"
  type        = number
  default     = 50
}

variable "timeout_seconds" {
  description = "Number of seconds after which the request times out"
  type        = number
  default     = 300
}

variable "bucket_name" {
  default = "da-tf-bucket"
}

variable "bucket_location" {
  default = "US"
}

variable "bucket_force_destroy" {
  type    = bool
  default = false
}

resource "google_cloud_run_service" "service" {
  name     = var.service_name
  location = var.region

  template {
    spec {
      containers {
        image = var.container_image
        resources {
          limits = {
            cpu    = var.cpu_limit
            memory = var.memory_limit
          }
        }
        ports {
          container_port = var.container_port
        }
        env {
          name  = "NODE_ENV"
          value = var.node_env
        }
        env {
          name  = "BUCKET"
          value = google_storage_bucket.bucket.name
        }
      }

      container_concurrency = var.container_concurrency
      timeout_seconds       = var.timeout_seconds
    }
    metadata {
      annotations = {
        "autoscaling.knative.dev/maxScale" = var.max_scale
        "run.googleapis.com/client-name"   = "terraform"
      }
    }
  }

  autogenerate_revision_name = true

  traffic {
    percent         = 100
    latest_revision = true
  }

  lifecycle {
    ignore_changes = [
      metadata.0.annotations,
    ]
  }

}

resource "google_storage_bucket" "bucket" {
  name                        = var.bucket_name
  project                     = var.project_id
  location                    = var.bucket_location
  uniform_bucket_level_access = false
  force_destroy               = var.bucket_force_destroy

}

output "service_url" {
  value = google_cloud_run_service.service.status.0.url
}
