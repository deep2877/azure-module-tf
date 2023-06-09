// Module Definitions for resources

# Resrouce Group Creation Module
module "gc_resource_group" {
  source   = "./modules/resource_group"
  name     = var.resource_group_name
  location = var.resource_group_location
}

# Create a virtual network within the resource group
module "gc_virtual_network" {
  source              = "./modules/virtual_network"
  name                = var.virtual_network_name
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  address_space       = ["10.0.0.0/16"]

  depends_on = [module.gc_resource_group]
}

# Subnet Creation
module "gc_subnet_01" {
  source               = "./modules/subnet"
  name                 = var.subnet_01
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = ["10.0.1.0/24"]

  depends_on = [module.gc_resource_group, module.gc_virtual_network]
}

# Network Security Group Creation
module "gc_network_security_group" {
  source              = "./modules/network_security_group"
  name                = var.network_security_group_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name

  depends_on = [module.gc_resource_group]
}

# Public IP address allocation
module "gc_public_ip_address" {
  source              = "./modules/public_ip"
  name                = var.public_ip_name
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  allocation_method   = var.allocation_method

  depends_on = [module.gc_resource_group]
}

# Network Interface Creation
module "gc_network_interface" {
  source               = "./modules/network_interface"
  name                 = var.network_interface_name
  location             = var.resource_group_location
  resource_group_name  = var.resource_group_name
  subnet_id            = module.gc_subnet_01.subnet_id
  public_ip_address_id = module.gc_public_ip_address.public_ip_address_id

  depends_on = [module.gc_resource_group, module.gc_subnet_01, module.gc_public_ip_address]
}

# Linux Virtual Machine Creation
module "gc_linux_virtual_machine" {
  source              = "./modules/linux_virtual_machine"
  name                = var.linux_virtual_machine_name
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  size                = var.linux_virtual_machine_size
  admin_username      = var.lvm_username

  network_interface_id      = module.gc_network_interface.network_interface_id
  network_security_group_id = module.gc_network_security_group.network_security_group_id

  source_image_publisher = var.source_image_publisher
  source_image_offer     = var.source_image_offer
  source_image_sku       = var.source_image_sku

  depends_on = [module.gc_resource_group, module.gc_virtual_network, module.gc_network_security_group, module.gc_network_interface, module.gc_subnet_01, module.gc_public_ip_address]
}