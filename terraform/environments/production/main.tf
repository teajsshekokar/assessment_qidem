module "common_infra" {
  source              = "../../commons"
  project             = "mediq"
  resource_group_name = "mediqRG"
  location            = "westeurope"

  # Create Vnet and Public Subnet
  vnet_name          = "main-vnet"
  vnet_address_space = ["10.0.0.0/16"]
  subnet_name        = "public-subnet"
  subnet_prefix      = ["10.0.1.0/24"]

  # Linux VM configuration
  linux_vm_name = "ubuntu-vm"
  ssh_key       = "~/.ssh/id_rsa.pub"

  # Windows VM configuration
  windows_vm_name = "windows-vm"
  admin_username  = var.windows_admin_user
  admin_password  = var.windows_admin_password
}