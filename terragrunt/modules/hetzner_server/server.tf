resource "hcloud_server" "server" {
  name        = local.name
  server_type = local.server_type
  image       = local.image
  location    = local.location
  user_data   = local.user_data
  ssh_keys    = local.ssh_keys
  keep_disk   = local.keep_disk
  iso         = local.iso
  rescue      = local.rescue
  labels      = local.labels
  backups     = local.backups
  public_net {
    ipv4_enabled = local.public_net.ipv4_enabled
    ipv6_enabled = local.public_net.ipv6_enabled
  }
  network {
    network_id = local.network.network_id
    ip         = local.network.ip
    #    alias_ips   = local.network.alias_ips
    #    mac_address = local.network.mac_address
  }
  firewall_ids               = local.firewall_ids
  ignore_remote_firewall_ids = local.ignore_remote_firewall_ids
  delete_protection          = local.delete_protection
  rebuild_protection         = local.rebuild_protection
  allow_deprecated_images    = local.allow_deprecated_images
  shutdown_before_deletion   = local.shutdown_before_deletion
}
