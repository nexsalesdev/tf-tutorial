locals {
  env = [
    {
      name  = "NODE_ENV"
      value = var.node_env
    },
    {
      name  = "BUCKET"
      value = google_storage_bucket.bucket.name
    }
  ]
}

data "docker_registry_image" "service_image" {
  name = var.container_image
}

data "google_container_registry_image" "service_image_registry" {
  project = var.project_id
  name    = var.image_name
  digest  = data.docker_registry_image.service_image.sha256_digest
}

resource "google_cloud_run_service" "service" {
  name     = var.service_name
  location = var.region

  template {
    spec {
      containers {
        image = data.google_container_registry_image.service_image_registry.image_url
        resources {
          limits = {
            cpu    = var.cpu_limit
            memory = var.memory_limit
          }
        }
        ports {
          container_port = var.container_port
        }
        dynamic "env" {
          for_each = local.env
          content {
            name  = env.value["name"]
            value = env.value["value"]
          }
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
