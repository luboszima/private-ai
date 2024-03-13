variable "network_id" {
  description = "ID of the Network."
  type        = number
  validation {
    condition     = can(regex("^[0-9]+$", var.network_id))
    error_message = "Variable network_id must be a number."
  }
  validation {
    condition     = var.network_id > 0
    error_message = "Variable network_id must be greater than 0."
  }
}

variable "type" {
  description = "Type of subnet. server, cloud or vswitch"
  type        = string
  default     = "cloud"
  validation {
    condition     = can(regex("server|cloud|vswitch", var.type))
    error_message = "Type must be server, cloud or vswitch."
  }
}

variable "ip_range" {
  description = "Range to allocate IPs from."
  type        = string
  validation {
    condition     = can(regex("^(?:[0-9]{1,3}.){3}[0-9]{1,3}/[0-9]{1,2}$", var.ip_range))
    error_message = "Variable ip_range must be in the form of x.x.x.x/x."
  }
}

variable "network_zone" {
  description = "Name of network zone."
  type        = string
  default     = "eu-central"
}

locals {
  network_id   = try(var.network_id, null)
  type         = try(var.type, "cloud")
  ip_range     = try(var.ip_range, "10.0.1.0/24")
  network_zone = try(var.network_zone, "eu-central" )
}
