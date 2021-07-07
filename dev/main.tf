module "app" {
  source = "../app"

  service_name = "dev-nginx"
  bucket_name  = "dev-nx-tf-bucket"
}
