output "vmss_password" {
  sensitive = true
  value     = azurerm_linux_virtual_machine_scale_set.weight_app_vmss.admin_password 
  description = "Holds the value of the machines password"
}