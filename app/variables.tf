# Versions
variable "region" {
  description = "Region in which resources are created"
  type        = string
  default     = "us-central1"
}

# CloudRun
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

variable "image_name" {
  description = "Name of the container image"
  type        = string
  default     = "nginx"
}

variable "container_image" {
  description = "URL of the container image"
  type        = string
  default     = "gcr.io/nx-tf-tutorial/nginx:1.19.0"
}

variable "cpu_limit" {
  description = "Maximum amount of CPUs needed"
  type        = string
  default     = "1000m"
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
  default     = 600
}

# Bucket
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
