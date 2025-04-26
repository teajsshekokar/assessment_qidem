output "linux_vm_public_ip" {
  description = "Public IP address of the Linux VM"
  value       = module.common_infra.linux_vm_public_ip
}

output "windows_vm_public_ip" {
  description = "Public IP address of the Windows VM"
  value       = module.common_infra.windows_vm_public_ip
}
