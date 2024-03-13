terraform {
  source = "${get_parent_terragrunt_dir()}/../modules/hetzner_server"
}

include {
  path = find_in_parent_folders()
}

dependency "subnet" {
  config_path = "${get_original_terragrunt_dir()}/../subnet/terragrunt.hcl"

  # hotfix to avoid terragrunt error when infra is not deployed
  mock_outputs = {
    network_id = "1234567890"
    ip_range   = "10.1.1.0/24"
  }
}

dependency "ssh_key" {
  config_path = "${get_original_terragrunt_dir()}/../ssh_key/terragrunt.hcl"

  # hotfix to avoid terragrunt error when infra is not deployed
  mock_outputs = {
    id = "123"
  }
}

locals {
  settings = yamldecode(file("${get_parent_terragrunt_dir()}/settings.yaml"))
  region   = yamldecode(file("${get_parent_terragrunt_dir()}/region.yaml"))
  env      = yamldecode(file("${get_parent_terragrunt_dir()}/../../.env.yaml"))
}

inputs = {
  location    = local.region["location"]
  name        = "ai-${local.region["location"]}"
  server_type = "cpx51"

  public_net = {
    ipv4_enabled = true
    ipv4         = ""
    ipv6_enabled = false
    ipv6         = ""
  }

  network = {
    network_id = dependency.subnet.outputs.network_id
    ip         = cidrhost(dependency.subnet.outputs.ip_range, 2)
  }

  ssh_keys = [
    dependency.ssh_key.outputs.id
  ]

  labels = {
    location  = local.region["location"]
    terraform = "true"
  }
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = templatefile("${get_parent_terragrunt_dir()}/provider_template.tftpl", {
    providers = { hetzner : local.settings["providers"]["hetzner"] },
    secrets   = { hetzner = local.env["secrets"]["hetzner"] }
  })
}

generate "cloud_init" {
  path      = "cloud_init.yaml"
  if_exists = "overwrite_terragrunt"
  comment_prefix = "#cloud-config "
  contents  = templatefile("${get_original_terragrunt_dir()}/cloud_init.yaml.tftpl", {
    user_name           = "devops"
    init_ssh_public_key = local.env["secrets"]["pub_ssh_key"]
    timezone            = local.region["timezone"]
  })
}
