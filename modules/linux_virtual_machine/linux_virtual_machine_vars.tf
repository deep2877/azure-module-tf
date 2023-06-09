variable "name" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "size" {
  type = string
}

variable "admin_username" {
  type = string
}

variable "source_image_publisher" {
  type = string
}

variable "source_image_offer" {
  type = string
}

variable "source_image_sku" {
  type = string
}

variable "network_interface_id" {
  description = "Network Interface ID"
}

variable "network_security_group_id" {
  description = "Network Security Group ID"
}