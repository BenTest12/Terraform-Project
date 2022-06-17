variable "weight_app_name_prefix" {
  type = string
  description = "Prefix setting for custom app names"
}
variable "vnet_address_range" {
  type = string
  description = "Vnet address range variable"
}
variable "resource_group_location" {
  type = string
  description = "Resource group variable for custom locations"
}
variable "resource_group_name" {
  type = string
  description = "Resource group name variable for custom RG names"
}
variable "authorized_ip_address" {
  type = string
  description = "A variable that stores my WAN IP"
}
variable "app_subnet_address_range" {
  type = string
  description = "Application subnet range"
}
variable "database_subnet_address_range" {
  type = string
  description = "Postgres DB Subnet range"
}
variable "weight_app_key" {
  type = string
  description = "Public ssh identity key variable"
}
variable "admin_user" {
  type = string
  description = "Admin user for the VM Scaleset"
}
variable "admin_password" {
  type = string
  description = "Admin password for the VM Scaleset"
}
variable "postgres_password" {
  type = string
  description = "PostgresDB Admin Password Variable"
}

variable "postgres_admin_username" {
  type = string
  description = "PostgresDB Admin User Variable"
}

variable "postgres_sku_name" {
  type = string
  description = "PostgresDB Server SKU , Used to determine the server "
}

variable "weight_app_image_version_name" {
  type = string
  description = "My custom Weight App OS Image version"
}
variable "weight_app_image_name" {
  type = string
  description = "My custom Weight App OS Image name"
}
variable "weight_app_image_gallery_name" {
  type = string
  description = "My custom OS Images Gallery"
}
variable "weight_app_image_resource_group_name" {
  type = string
  description = "Custom OS Image RG"
}