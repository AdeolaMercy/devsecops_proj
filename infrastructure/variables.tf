variable "location" {
  default = "UK West"
}

variable "resource_group_name" {
  default = "rg-linux-docker"
}

variable "vm_name" {
  default = "vm-linux-docker"
}

variable "admin_username" {
  default = "azureuser"
}

variable "public_key" {
  description = "SSH public key"
  type        = string
}
