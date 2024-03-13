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
| [hcloud_server.server](https://registry.terraform.io/providers/hashicorp/hcloud/latest/docs/resources/server) | resource |
| [hcloud_datacenters.ds](https://registry.terraform.io/providers/hashicorp/hcloud/latest/docs/data-sources/datacenters) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allow_deprecated_images"></a> [allow\_deprecated\_images](#input\_allow\_deprecated\_images) | Whether to allow deprecated images for the server | `bool` | `false` | no |
| <a name="input_backups"></a> [backups](#input\_backups) | Whether to enable backups for the server | `bool` | `false` | no |
| <a name="input_datacenter"></a> [datacenter](#input\_datacenter) | The datacenter of the server | `string` | `"nbg1-dc3"` | no |
| <a name="input_delete_protection"></a> [delete\_protection](#input\_delete\_protection) | Whether to enable delete protection for the server | `bool` | `false` | no |
| <a name="input_firewall_ids"></a> [firewall\_ids](#input\_firewall\_ids) | The firewall IDs to use for the server | `list(string)` | `[]` | no |
| <a name="input_ignore_remote_firewall_ids"></a> [ignore\_remote\_firewall\_ids](#input\_ignore\_remote\_firewall\_ids) | Whether to ignore remote firewall IDs | `bool` | `false` | no |
| <a name="input_image"></a> [image](#input\_image) | The image to use for the server | `string` | `"ubuntu-22.04"` | no |
| <a name="input_iso"></a> [iso](#input\_iso) | The ISO to mount on the server | `string` | `""` | no |
| <a name="input_keep_disk"></a> [keep\_disk](#input\_keep\_disk) | Whether to keep the disk when downgrading the server | `bool` | `false` | no |
| <a name="input_labels"></a> [labels](#input\_labels) | The labels to use for the server | `map(string)` | `{}` | no |
| <a name="input_location"></a> [location](#input\_location) | The location of the server | `string` | `"nbg1"` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the resource | `string` | n/a | yes |
| <a name="input_network"></a> [network](#input\_network) | The network to use for the server | <pre>object({<br>    network_id = number<br>    ip         = string<br>    #    alias_ips  = list(string)<br>    #    mac_address = string<br>  })</pre> | n/a | yes |
| <a name="input_placement_group_id"></a> [placement\_group\_id](#input\_placement\_group\_id) | The placement group ID to use for the server | `string` | `""` | no |
| <a name="input_public_net"></a> [public\_net](#input\_public\_net) | The public network configuration for the server | <pre>object({<br>    ipv4_enabled = bool<br>    ipv4         = string<br>    ipv6_enabled = bool<br>    ipv6         = string<br>  })</pre> | <pre>{<br>  "ipv4": "",<br>  "ipv4_enabled": true,<br>  "ipv6": "",<br>  "ipv6_enabled": false<br>}</pre> | no |
| <a name="input_rebuild_protection"></a> [rebuild\_protection](#input\_rebuild\_protection) | Whether to enable rebuild protection for the server | `bool` | `false` | no |
| <a name="input_rescue"></a> [rescue](#input\_rescue) | The rescue system to use for the server | `string` | `""` | no |
| <a name="input_server_type"></a> [server\_type](#input\_server\_type) | The type of server | `string` | n/a | yes |
| <a name="input_shutdown_before_deletion"></a> [shutdown\_before\_deletion](#input\_shutdown\_before\_deletion) | Whether to try shutting the server down gracefully before deleting it | `bool` | `true` | no |
| <a name="input_ssh_keys"></a> [ssh\_keys](#input\_ssh\_keys) | The SSH keys to use for the server | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | n/a |
| <a name="output_ipv4"></a> [ipv4](#output\_ipv4) | n/a |
| <a name="output_ipv6"></a> [ipv6](#output\_ipv6) | n/a |
| <a name="output_name"></a> [name](#output\_name) | n/a |
<!-- END_TF_DOCS -->
