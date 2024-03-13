<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_server"></a> [server](#module\_server) | ./server | 0.0.1 |

## Resource


No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_servers"></a> [servers](#input\_servers) | list of object with defined servers | <pre>list(object({<br>    # (Required, string) Name of the server to create (must be unique per project and a valid hostname as per RFC 1123).<br>    name = string<br>    # (Required, string) Name of the server type this server should be created with.<br>    server_type = string<br>    # (Required, string) Name or ID of the image the server is created from.<br>    image = string<br>  }))</pre> | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_servers_ids"></a> [servers\_ids](#output\_servers\_ids) | n/a |
<!-- END_TF_DOCS -->
