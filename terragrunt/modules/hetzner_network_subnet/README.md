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
| [hcloud_network_subnet.subnet](https://registry.terraform.io/providers/hashicorp/hcloud/latest/docs/resources/network_subnet) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ip_range"></a> [ip\_range](#input\_ip\_range) | Range to allocate IPs from. | `string` | n/a | yes |
| <a name="input_network_id"></a> [network\_id](#input\_network\_id) | ID of the Network. | `number` | n/a | yes |
| <a name="input_network_zone"></a> [network\_zone](#input\_network\_zone) | Name of network zone. | `string` | `"eu-central"` | no |
| <a name="input_type"></a> [type](#input\_type) | Type of subnet. server, cloud or vswitch | `string` | `"cloud"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | n/a |
| <a name="output_ip_range"></a> [ip\_range](#output\_ip\_range) | n/a |
| <a name="output_network_id"></a> [network\_id](#output\_network\_id) | n/a |
<!-- END_TF_DOCS -->
