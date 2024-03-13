<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_hcloud"></a> [hcloud](#provider\_hcloud) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [hcloud_network.network](https://registry.terraform.io/providers/hashicorp/hcloud/latest/docs/resources/network) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_delete_protection"></a> [delete\_protection](#input\_delete\_protection) | Whether delete protection is enabled. | `bool` | `false` | no |
| <a name="input_expose_routes_to_vswitch"></a> [expose\_routes\_to\_vswitch](#input\_expose\_routes\_to\_vswitch) | Indicates if the routes from this network should be exposed to the vSwitch connection. The exposing only takes effect if a vSwitch connection is active. | `bool` | `false` | no |
| <a name="input_ip_range"></a> [ip\_range](#input\_ip\_range) | IPv4 Prefix of the whole Network. | `string` | n/a | yes |
| <a name="input_labels"></a> [labels](#input\_labels) | User-defined labels (key-value pairs). | `map(string)` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name of the resource | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | n/a |
<!-- END_TF_DOCS -->
