variable "weight_app_name_prefix" {
  type = string
}
variable "vnet_address_range" {
  type = string
}
variable "resource_group_location" {
  type = string
}
variable "resource_group_name" {
  type = string
}
variable "authorized_ip_address" {
  type = string
}
variable "app_subnet_address_range" {
  type = string
}
variable "database_subnet_address_range" {
  type = string
}
variable "weight_app_key" {
  type = string
}
variable "admin_user" {
  type = string
}
variable "admin_password" {
  type = string
}
variable "postgres_password" {
  type = string
}

variable "postgres_admin_username" {
  type = string
}

variable "postgres_sku_name" {
  type = string
}

variable "weight_app_image_version_name" {
  type = string
}
variable "weight_app_image_name" {
  type = string
}
variable "weight_app_image_gallery_name" {
  type = string
}
variable "weight_app_image_resource_group_name" {
  type = string
}