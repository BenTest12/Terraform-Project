terraform {
  required_version = ">= 1.2.0"
}

resource "azurerm_storage_account" "tf_state_blob_account" {
  name                     = "ben121212storage"
  resource_group_name      = var.resource_group_name
  location                 = var.resource_group_location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "container" {
  name                  = "content"
  storage_account_name  = azurerm_storage_account.tf_state_blob_account.name
  container_access_type = "private"
}

resource "azurerm_storage_blob" "blob_storage_name" {
  name                   = "terraform_state"
  storage_account_name   = azurerm_storage_account.tf_state_blob_account.name
  storage_container_name = azurerm_storage_container.container.name
  type                   = "Block"
  source                 = ".terraform/terraform.tfstate"
}

