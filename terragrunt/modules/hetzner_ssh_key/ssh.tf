# Create a new SSH key
resource "hcloud_ssh_key" "default" {
  name       = var.name
  public_key = var.public_key
  labels     = var.labels
}

output "id" {
  value = hcloud_ssh_key.default.id
}
