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

variable "admin_ssh_key" {
  description = "SSH public key for the VM"
  type        = string
}

variable "allowed_ports" {
  default = [22, 5000, 5932]
}

variable "public_ip" {
  description = "User's public IP"
  type        = string
}

variable "ssh_public_key" {
  description = "Public SSH key for GitHub Actions deploy access"
  type        = string
}
