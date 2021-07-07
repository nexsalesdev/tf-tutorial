## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=0.15 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 3.60.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | >= 3.60.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_cloud_run_service.service](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_run_service) | resource |
| [google_storage_bucket.bucket](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket_force_destroy"></a> [bucket\_force\_destroy](#input\_bucket\_force\_destroy) | n/a | `bool` | `false` | no |
| <a name="input_bucket_location"></a> [bucket\_location](#input\_bucket\_location) | n/a | `string` | `"US"` | no |
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | Bucket | `string` | `"da-tf-bucket"` | no |
| <a name="input_container_concurrency"></a> [container\_concurrency](#input\_container\_concurrency) | Maximum number of conncurent connections allowed to the service | `number` | `50` | no |
| <a name="input_container_image"></a> [container\_image](#input\_container\_image) | URL of the container image | `string` | `"marketplace.gcr.io/google/nginx:1.15.12-20200906-141617"` | no |
| <a name="input_container_port"></a> [container\_port](#input\_container\_port) | Port which to listen on | `number` | `80` | no |
| <a name="input_cpu_limit"></a> [cpu\_limit](#input\_cpu\_limit) | Maximum amount of CPUs needed | `string` | `"1000m"` | no |
| <a name="input_max_scale"></a> [max\_scale](#input\_max\_scale) | Maximum number of instances of the service to scale | `number` | `5` | no |
| <a name="input_memory_limit"></a> [memory\_limit](#input\_memory\_limit) | Maximum amount of memory needed | `string` | `"256Mi"` | no |
| <a name="input_node_env"></a> [node\_env](#input\_node\_env) | Environment for the nodejs service | `string` | `"development"` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | ID of the Google Cloud Project | `string` | `"nx-tf-tutorial"` | no |
| <a name="input_region"></a> [region](#input\_region) | Region in which resources are created | `string` | `"us-central1"` | no |
| <a name="input_service_name"></a> [service\_name](#input\_service\_name) | Name of the cloud run service | `string` | `"node-service"` | no |
| <a name="input_timeout_seconds"></a> [timeout\_seconds](#input\_timeout\_seconds) | Number of seconds after which the request times out | `number` | `600` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_service_url"></a> [service\_url](#output\_service\_url) | n/a |
