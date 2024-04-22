resource "hcloud_network" "network" {
  name                     = local.name
  ip_range                 = local.ip_range
  labels                   = local.labels
  delete_protection        = local.delete_protection
  expose_routes_to_vswitch = local.expose_routes_to_vswitch

  lifecycle {
    ignore_changes = [ip_range, labels]
  }
}

output "id" {
  value = hcloud_network.network.id
}
