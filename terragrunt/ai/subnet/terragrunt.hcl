terraform {
  source = "${get_parent_terragrunt_dir()}/../modules/hetzner_network_subnet"
}

include {
  path = find_in_parent_folders()
}

dependency "network" {
  config_path = "${get_original_terragrunt_dir()}/../network/terragrunt.hcl"

  # hotfix to avoid terragrunt error when infra is not deployed
  mock_outputs = {
    id = "1234567890"
  }
}

locals {
  settings = yamldecode(file("${get_parent_terragrunt_dir()}/settings.yaml"))
  region   = yamldecode(file("${get_parent_terragrunt_dir()}/region.yaml"))
  env      = yamldecode(file("${get_parent_terragrunt_dir()}/../../.env.yaml"))
}

inputs = {
  network_id = dependency.network.outputs.id
  ip_range   = "${local.region["network"]["subnet"]["ip_range"]}"
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = templatefile("${get_parent_terragrunt_dir()}/provider_template.tftpl", {
    providers = { hetzner : local.settings["providers"]["hetzner"] },
    secrets   = { hetzner = local.env["secrets"]["hetzner"] }
  })
}
