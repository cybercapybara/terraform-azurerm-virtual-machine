output "id" {
  description = "ID of the virtual machine."
  value       = azurerm_linux_virtual_machine.this.id
}

output "name" {
  description = "Name of the virtual machine."
  value       = azurerm_linux_virtual_machine.this.name
}

output "private_ip_address" {
  description = "Primary private IP address assigned to the virtual machine."
  value       = azurerm_linux_virtual_machine.this.private_ip_address
}

output "public_ip_address" {
  description = "Primary public IP address assigned to the virtual machine, if any."
  value       = azurerm_linux_virtual_machine.this.public_ip_address
}
