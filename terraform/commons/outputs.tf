output "linux_vm_public_ip" {
  description = "Public IP address of the Linux VM"
  value       = azurerm_public_ip.linux_public_ip.ip_address
}

output "windows_vm_public_ip" {
  description = "Public IP address of the Windows VM"
  value       = azurerm_public_ip.windows_public_ip.ip_address
}
