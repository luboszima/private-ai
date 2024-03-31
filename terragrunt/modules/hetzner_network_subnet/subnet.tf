resource "hcloud_network_subnet" "subnet" {
  network_id   = local.network_id
  type         = local.type
  network_zone = local.network_zone
  ip_range     = local.ip_range

  lifecycle {
    ignore_changes = [ip_range, type]
  }
}

output "id" {
  value = hcloud_network_subnet.subnet.id
}

output "network_id" {
  value = hcloud_network_subnet.subnet.network_id
}

output "ip_range" {
  value = hcloud_network_subnet.subnet.ip_range
}
