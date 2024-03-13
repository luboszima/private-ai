output "id" {
  value = hcloud_server.server.id
}

output "name" {
  value = hcloud_server.server.name
}

output "ipv4" {
  value = hcloud_server.server.ipv4_address
}

output "ipv6" {
  value = hcloud_server.server.ipv6_address
}
