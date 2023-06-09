variable "name" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "subnet_id" {
  description = "Subnet ID from the subnet group"
}

variable "public_ip_address_id" {
  description = "Public IP Address from IP allocations"
}