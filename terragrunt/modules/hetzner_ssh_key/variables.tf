variable "name" {
  description = "The name of the resource"
  type        = string
  validation {
    condition     = length(var.name) > 0
    error_message = "The name of the resource must not be empty."
  }
}

variable "public_key" {
  description = "The public key to be used for SSH access."
  type        = string
  validation {
    condition     = length(var.public_key) > 0
    error_message = "The public key must not be empty."
  }
}

variable "labels" {
  description = "User-defined labels (key-value pairs) should be created with."
  type        = map(string)
  default     = {}
}
