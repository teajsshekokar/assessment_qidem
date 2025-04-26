variable "project" {
  description = "Project Name"
}

variable "resource_group_name" {
  description = "Name of the Azure Resource Group"
  type        = string
}

variable "location" {
  description = "Azure region for resource deployment"
  type        = string
  default     = "westeurope"
}

variable "vnet_name" {
  description = "Name of the Virtual Network"
  type        = string
  default     = "main-vnet"
}

variable "subnet_name" {
  description = "Name of the Subnet"
  type        = string
  default     = "public-subnet"
}

variable "vnet_address_space" {
  description = "Address space for the Virtual Network"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "subnet_prefix" {
  description = "Address prefix for the Subnet"
  type        = list(string)
  default     = ["10.0.1.0/24"]
}

variable "linux_vm_name" {
  description = "Name of the Linux Virtual Machine"
  type        = string
  default     = "linux-vm"
}

variable "windows_vm_name" {
  description = "Name of the Windows Virtual Machine"
  type        = string
  default     = "windows-vm"
}

variable "admin_username" {
  description = "Admin username for the VMs"
  type        = string
  default     = "azureuser"
  sensitive   = true
}

variable "admin_password" {
  description = "Admin password for the Windows VM"
  type        = string
  sensitive   = true
}

variable "ssh_key" {
  description = "Linux VM SSH Key"
  default     = "~/.ssh/id_rsa.pub"
}
