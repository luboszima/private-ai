terraform {
  source = "${get_parent_terragrunt_dir()}/../modules/hetzner_ssh_key"
}

include {
  path = find_in_parent_folders()
}

locals {
  settings = yamldecode(file("${get_parent_terragrunt_dir()}/settings.yaml"))
  region   = yamldecode(file("${get_parent_terragrunt_dir()}/region.yaml"))
  env      = yamldecode(file("${get_parent_terragrunt_dir()}/../../.env.yaml"))
}

inputs = {
  name       = "ssh_key-${local.region["location"]}"
  public_key = local.env["secrets"]["pub_ssh_key"]
  labels = {
    location  = local.region["location"]
    terraform = "true"
  }
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = templatefile("${get_parent_terragrunt_dir()}/provider_template.tftpl", {
    providers = { hetzner : local.settings["providers"]["hetzner"] },
    secrets   = { hetzner = local.env["secrets"]["hetzner"] }
  })
}
