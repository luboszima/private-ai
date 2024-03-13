variable "name" {
  description = "The name of the resource"
  type        = string
}

variable "ip_range" {
  description = "IPv4 Prefix of the whole Network."
  type        = string
}

variable "labels" {
  description = "User-defined labels (key-value pairs)."
  type        = map(string)
}

variable "delete_protection" {
  description = "Whether delete protection is enabled."
  default     = false
  type        = bool
}

variable "expose_routes_to_vswitch" {
  description = "Indicates if the routes from this network should be exposed to the vSwitch connection. The exposing only takes effect if a vSwitch connection is active."
  default     = false
  type        = bool
}

locals {
  name                     = try(var.name, "network")
  ip_range                 = try(var.ip_range, "10.0.0.0/8")
  labels                   = try(var.labels, {})
  delete_protection        = try(var.delete_protection, false)
  expose_routes_to_vswitch = try(var.expose_routes_to_vswitch, false)
}
