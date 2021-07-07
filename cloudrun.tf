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
