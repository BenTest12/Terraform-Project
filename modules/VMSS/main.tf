terraform {
  required_version = ">= 1.2.0"
}


# Linking configed image of the app for use of the vmss OS
data "azurerm_shared_image_version" "ServerImage" {
  name                = var.weight_app_image_version_name
  image_name          = var.weight_app_image_name
  gallery_name        = var.weight_app_image_gallery_name
  resource_group_name = var.weight_app_image_resource_group_name
}

resource "azurerm_linux_virtual_machine_scale_set" "weight_app_vmss" {
  name                            = "${var.weight_app_name_prefix}-vmss"
  admin_username                  = var.admin_user
  admin_password                  = var.admin_password
  instances                       = var.number_of_instances
  location                        = var.resource_group_location
  resource_group_name             = var.resource_group_name
  sku                             = "Standard_B1s"
  upgrade_mode                    = "Automatic"
  disable_password_authentication = false
  depends_on                      = [var.weight_app_nsg_id]
  source_image_id                 = data.azurerm_shared_image_version.ServerImage.id

  network_interface {
    name                      = "netInterface"
    primary                   = true
    network_security_group_id = var.weight_app_nsg_id
    ip_configuration {
      name                                   = "publicIP"
      load_balancer_backend_address_pool_ids = [var.lb_bepool_id]
      load_balancer_inbound_nat_rules_ids    = [var.lbnatpool_id]
      subnet_id                              = var.weight_app_subnet_id
      primary                                = true

    }
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "StandardSSD_LRS"
  }

}

resource "azurerm_monitor_autoscale_setting" "autoscale_setting" {
  location            = var.resource_group_location
  name                = "autoscale_setting"
  resource_group_name = var.resource_group_name
  target_resource_id  = azurerm_linux_virtual_machine_scale_set.weight_app_vmss.id
  depends_on          = [var.resource_group_name, azurerm_linux_virtual_machine_scale_set.weight_app_vmss]
  profile {
    name = "AutoScale"
    capacity {
      default = 2
      maximum = 5
      minimum = 2
    }

    rule {
      metric_trigger {
        metric_name        = "Percentage CPU"
        metric_resource_id = azurerm_linux_virtual_machine_scale_set.weight_app_vmss.id
        operator           = "GreaterThan"
        statistic          = "Average"
        threshold          = 75
        time_aggregation   = "Average"
        time_grain         = "PT1M"
        time_window        = "PT5M"
        metric_namespace   = "microsoft.compute/virtualmachinescalesets"
      }
      scale_action {
        cooldown  = "PT1M"
        direction = "Increase"
        type      = "ChangeCount"
        value     = 1
      }
    }
    rule {
      metric_trigger {
        metric_name        = "Percentage CPU"
        metric_resource_id = azurerm_linux_virtual_machine_scale_set.weight_app_vmss.id
        time_grain         = "PT1M"
        statistic          = "Average"
        time_window        = "PT5M"
        time_aggregation   = "Average"
        operator           = "LessThan"
        threshold          = 25
        metric_namespace   = "microsoft.compute/virtualmachinescalesets"
      }

      scale_action {
        direction = "Decrease"
        type      = "ChangeCount"
        value     = "1"
        cooldown  = "PT1M"
      }
    }
  }
}
