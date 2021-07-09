## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=0.15 |
| <a name="requirement_docker"></a> [docker](#requirement\_docker) | 2.12.2 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 3.60.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_docker"></a> [docker](#provider\_docker) | 2.12.2 |
| <a name="provider_google"></a> [google](#provider\_google) | >= 3.60.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_cloud_run_service.service](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_run_service) | resource |
| [google_cloud_run_service_iam_policy.noauth](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_run_service_iam_policy) | resource |
| [google_storage_bucket.bucket](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket) | resource |
| [docker_registry_image.service_image](https://registry.terraform.io/providers/kreuzwerker/docker/2.12.2/docs/data-sources/registry_image) | data source |
| [google_client_config.default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/client_config) | data source |
| [google_container_registry_image.service_image_registry](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/container_registry_image) | data source |
| [google_iam_policy.noauth](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/iam_policy) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket_force_destroy"></a> [bucket\_force\_destroy](#input\_bucket\_force\_destroy) | n/a | `bool` | `false` | no |
| <a name="input_bucket_location"></a> [bucket\_location](#input\_bucket\_location) | n/a | `string` | `"US"` | no |
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | Bucket | `string` | `"da-tf-bucket"` | no |
| <a name="input_container_concurrency"></a> [container\_concurrency](#input\_container\_concurrency) | Maximum number of conncurent connections allowed to the service | `number` | `50` | no |
| <a name="input_container_image"></a> [container\_image](#input\_container\_image) | URL of the container image | `string` | `"gcr.io/nx-tf-tutorial/nginx:1.19.0"` | no |
| <a name="input_container_port"></a> [container\_port](#input\_container\_port) | Port which to listen on | `number` | `80` | no |
| <a name="input_cpu_limit"></a> [cpu\_limit](#input\_cpu\_limit) | Maximum amount of CPUs needed | `string` | `"1000m"` | no |
| <a name="input_image_name"></a> [image\_name](#input\_image\_name) | Name of the container image | `string` | `"nginx"` | no |
| <a name="input_max_scale"></a> [max\_scale](#input\_max\_scale) | Maximum number of instances of the service to scale | `number` | `5` | no |
| <a name="input_memory_limit"></a> [memory\_limit](#input\_memory\_limit) | Maximum amount of memory needed | `string` | `"256Mi"` | no |
| <a name="input_node_env"></a> [node\_env](#input\_node\_env) | Environment for the nodejs service | `string` | `"development"` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | ID of the Google Cloud Project | `string` | `"nx-tf-tutorial"` | no |
| <a name="input_region"></a> [region](#input\_region) | Region in which resources are created | `string` | `"us-central1"` | no |
| <a name="input_service_name"></a> [service\_name](#input\_service\_name) | Name of the cloud run service | `string` | `"nginx"` | no |
| <a name="input_subdomain"></a> [subdomain](#input\_subdomain) | Subdomain for the environment | `string` | n/a | yes |
| <a name="input_timeout_seconds"></a> [timeout\_seconds](#input\_timeout\_seconds) | Number of seconds after which the request times out | `number` | `600` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_service_url"></a> [service\_url](#output\_service\_url) | n/a |
