variable "weight_app_name_prefix" {
  type = string
}
variable "admin_user" {
  type = string
}
variable "number_of_instances" {
  type = number
  default = 2
}
variable "resource_group_location" {
  type = string
}
variable "resource_group_name" {
  type = string
}
variable "admin_password" {
  type = string
}
variable "weight_app_nsg_id" {
  type = string
}
variable "weight_app_subnet_id" {
  type = string
}
variable "lb_bepool_id" {
  type = string
}
variable "lbnatpool_id" {
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

