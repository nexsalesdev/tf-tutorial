resource "google_storage_bucket" "bucket" {
  name                        = "${var.subdomain}-${var.bucket_name}"
  project                     = var.project_id
  location                    = var.bucket_location
  uniform_bucket_level_access = false
  force_destroy               = var.bucket_force_destroy

}
