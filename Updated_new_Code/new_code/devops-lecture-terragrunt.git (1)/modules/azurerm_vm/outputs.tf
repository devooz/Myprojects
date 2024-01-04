output "network_interface_ids" {
  description = "ids of the vm nics provisoned."
  value       = azurerm_network_interface.example.*.id
}

output "network_interface_private_ip" {
  description = "private ip address of the vm provisoned."
  value       = azurerm_network_interface.example.*.private_ip_address
}