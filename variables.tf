################## Azure CLI variables ##################
variable "client_id" {
  type        = string
  description = "Azure client ID for Terraform"
}

variable "client_secret" {
  type        = string
  description = "Azure client secret for Terraform"
}

variable "tenant_id" {
  type        = string
  description = "Azure tenant ID for Terraform"
}

variable "subscription_id" {
  type        = string
  description = "Azure subscription ID for Terraform"
}

################## Resource Group Variables ##################
variable "resource_group_name" {
  type        = string
  description = "Resource Group Name"
}

variable "resource_group_location" {
  type        = string
  description = "Environment Location"
}

################## Virtual Netwrok Variables ##################
variable "virtual_network_name" {
  type        = string
  description = "Resource Group Name"
}

################## Subnet Variables ##################
variable "subnet_01" {
  type = string
}

################## Network Security Group Variables ##################
variable "network_security_group_name" {
  type = string
}

################## Public IP Address Variables ##################
variable "public_ip_name" {
  type = string
}

variable "allocation_method" {
  type = string
}

################## Network Interface Variables ##################
variable "network_interface_name" {
  type = string
}

################## Linux Virtual Machine variables ##################
variable "linux_virtual_machine_name" {
  type = string
}

variable "linux_virtual_machine_size" {
  type = string
}

variable "lvm_username" {
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