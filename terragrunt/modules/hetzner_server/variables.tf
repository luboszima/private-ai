variable "name" {
  description = "The name of the resource"
  type        = string
}

variable "server_type" {
  description = "The type of server"
  type        = string
}

# (Required, string) Name or ID of the image the server is created from.
# Note the image property is only required when using the resource to create servers.
# As the Hetzner Cloud API may return servers without an image ID set it is not
# marked as required in the Terraform Provider itself. Thus, users will get an error
# from the underlying client library if they forget to set the property and try to create a server.
variable "image" {
  description = "The image to use for the server"
  type        = string
  default     = "ubuntu-22.04"
  validation {
    condition     = length(var.image) > 0
    error_message = "Image must be a non-empty string."
  }
}

# (Optional, string) The location name to create the server in. nbg1, fsn1, hel1, ash or hil
variable "location" {
  description = "The location of the server"
  type        = string
  default     = "nbg1"
  validation {
    condition     = length(var.location) > 0
    error_message = "Location must be a non-empty string."
  }
  validation {
    condition     = can(regex("nbg1|fsn1|hel1|ash|hil", var.location))
    error_message = "Location must be one of nbg1, fsn1, hel1, ash or hil."
  }
}

# (Optional, string) The datacenter name to create the server in. nbg1-dc3, fsn1-dc14, hel1-dc2, ash-dc1 or hil-dc1
variable "datacenter" {
  description = "The datacenter of the server"
  type        = string
  default     = "nbg1-dc3"
  validation {
    condition     = length(var.datacenter) > 0
    error_message = "Datacenter must be a non-empty string."
  }
  validation {
    condition     = can(regex("nbg1-dc3|fsn1-dc14|hel1-dc2|ash-dc1|hil-dc1", var.datacenter))
    error_message = "Datacenter must be one of nbg1-dc3, fsn1-dc14, hel1-dc2, ash-dc1 or hil-dc1."
  }
}

# (Optional, string) Cloud-Init user data to use during server creation
#variable "user_data" {
#  description = "The user data to use for the server"
#  type        = string
#  default     = ""
#}

# (Optional, list) SSH key IDs or names which should be injected into
# the server at creation time. Once the server is created, you can not
# update the list of SSH Keys. If you do change this, you will be prompted
# to destroy and recreate the server. You can avoid this by setting
# lifecycle.ignore_changes to [ ssh_keys ].
variable "ssh_keys" {
  description = "The SSH keys to use for the server"
  type        = list(string)
  default     = []
}

# (Optional, block) In this block you can either enable / disable ipv4
# and ipv6 or link existing primary IPs (checkout the examples). If this
# block is not defined, two primary (ipv4 & ipv6) ips getting auto generated.
#     ipv4_enabled = true
#    ipv4 = hcloud_primary_ip.primary_ip_1.id
#    ipv6_enabled = true
variable "public_net" {
  description = "The public network configuration for the server"
  type = object({
    ipv4_enabled = bool
    ipv4         = string
    ipv6_enabled = bool
    ipv6         = string
  })
  default = {
    ipv4_enabled = true
    ipv4         = ""
    ipv6_enabled = false
    ipv6         = ""
  }
}

# (Optional, bool) If true, do not upgrade the disk. This allows downgrading the server type later.
variable "keep_disk" {
  description = "Whether to keep the disk when downgrading the server"
  type        = bool
  default     = false
}

# (Optional, string) ID or Name of an ISO image to mount.
variable "iso" {
  description = "The ISO to mount on the server"
  type        = string
  default     = ""
}

# (Optional, string) Enable and boot in to the specified rescue system. This enables simple installation of custom operating systems. linux64 or linux32
variable "rescue" {
  description = "The rescue system to use for the server"
  type        = string
  default     = ""
  #  validation {
  #    condition     = can(regex("linux64|linux32", var.rescue))
  #    error_message = "Rescue must be one of linux64 or linux32"
  #  }
}

# (Optional, map) User-defined labels (key-value pairs) should be created with.
variable "labels" {
  description = "The labels to use for the server"
  type        = map(string)
  default     = {}
}

# (Optional, bool) Enable or disable backups.
variable "backups" {
  description = "Whether to enable backups for the server"
  type        = bool
  default     = false
}

#  (Optional, list) Firewall IDs the server should be attached to on creation.
variable "firewall_ids" {
  description = "The firewall IDs to use for the server"
  type        = list(string)
  default     = []
}

# (Optional, bool) Ignores any updates to the firewall_ids argument which were received from the server.
# This should not be used in normal cases. See the documentation of the hcloud_firewall_attachment resource
# for a reason to use this argument.
variable "ignore_remote_firewall_ids" {
  description = "Whether to ignore remote firewall IDs"
  type        = bool
  default     = false
}

# (Optional) Network the server should be attached to on creation. (Can be specified multiple times)
#network support the following fields:
#  network_id - (Required, int) ID of the network
#  ip - (Optional, string) Specify the IP the server should get in the network
#  alias_ips - (Optional, list) Alias IPs the server should have in the Network.
variable "network" {
  description = "The network to use for the server"
  type = object({
    network_id = number
    ip         = string
    #    alias_ips  = list(string)
    #    mac_address = string
  })
}

# (Optional, string) Placement Group ID the server added to on creation.
variable "placement_group_id" {
  description = "The placement group ID to use for the server"
  type        = string
  default     = ""
}

# (Optional, bool) Enable or disable delete protection (Needs to be the same as rebuild_protection).
# See "Delete Protection" in the Provider Docs for details.
# https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs
variable "delete_protection" {
  description = "Whether to enable delete protection for the server"
  type        = bool
  default     = false
}

# (Optional, bool) Enable or disable rebuild protection (Needs to be the same as delete_protection).
variable "rebuild_protection" {
  description = "Whether to enable rebuild protection for the server"
  type        = bool
  default     = false
}

# (Optional, bool) Enable the use of deprecated images (default: false).
# Note Deprecated images will be removed after three months. Using them is then no longer possible.
variable "allow_deprecated_images" {
  description = "Whether to allow deprecated images for the server"
  type        = bool
  default     = false
}

# (bool) Whether to try shutting the server down gracefully before deleting it.
variable "shutdown_before_deletion" {
  description = "Whether to try shutting the server down gracefully before deleting it"
  type        = bool
  default     = true
}

data "hcloud_datacenters" "ds" {}

locals {
  # set default values for servers
  # use for cycle
  name        = var.name
  server_type = var.server_type
  image       = var.image
  # optional
  location  = try(var.location, "nbg1")
  user_data = fileexists("cloud_init.yaml") ? file("cloud_init.yaml") : ""
  ssh_keys  = try(var.ssh_keys, [])
  public_net = try(var.public_net, {
    ipv4_enabled = true
    ipv4         = ""
    ipv6_enabled = false
    ipv6         = ""
  })
  network = try(var.network, {
    network_id = try(var.network.network_id, 0)
    ip         = try(var.network.ip, "")
    #    alias_ips  = try(var.network.alias_ips, [])
    #    mac_address = try(var.network.mac_address, "")
  })
  keep_disk                  = try(var.keep_disk, false)
  iso                        = try(var.iso, "")
  rescue                     = try(var.rescue, "linux64")
  labels                     = try(var.labels, {})
  backups                    = try(var.backups, false)
  firewall_ids               = try(var.firewall_ids, [])
  ignore_remote_firewall_ids = try(var.ignore_remote_firewall_ids, false)
  placement_group_id         = try(var.placement_group_id, "")
  delete_protection          = try(var.delete_protection, false)
  rebuild_protection         = try(var.rebuild_protection, false)
  allow_deprecated_images    = try(var.allow_deprecated_images, false)
  shutdown_before_deletion   = try(var.shutdown_before_deletion, true)
}
