module "rg" {
  source  = "../../module/azurerm_rg"
  rg_info = var.rg_info
}
module "vnet" {
  source    = "../../module/azurerm_vnet"
  vnet_info = var.vnet_info
  rg_info   = module.rg.rg
}
module "subnet" {
  source      = "../../module/azurerm_subnet"
  subnet_info = var.subnet_info
  vnet_info   = module.vnet.vnet
  rg_info     = module.rg.rg
}
module "nic" {
  source = "../../module/azurerm_nic"

  nic_info    = var.nic_info
  rg_info     = module.rg.rg
  subnet_info = module.subnet.subnet
}
module "pip" {
  source   = "../../module/azurerm_pip"
  pip_info = var.pip_info
  rg_info  = module.rg.rg
}
module "vm" {
  source   = "../../module/azurerm_vm"
  vm_info  = var.vm_info
  rg_info  = module.rg.rg
  nic_info = module.nic.nic
}
module "bastion" {
  source       = "../../module/azurerm_bastion"
  bastion_info = var.bastion_info
  rg_info      = module.rg.rg
  subnet_info  = module.subnet.subnet
  pip_info     = module.pip.pip
}
module "nsg" {
  source   = "../../module/azurerm_nsg"
  nsg_info = var.nsg_info
  rg_info  = module.rg.rg
}