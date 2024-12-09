module "rgroup-n01662612" {
  source   = "./modules/rgroup-n01662612"
  rg_name  = "n01662612-RG"
  location = "Canada Central"
}

module "network-n01662612" {
  source                = "./modules/network-n01662612"
  vnet_name             = "n01662612-vnet"
  vnet_address_space    = ["10.0.0.0/16"]
  location              = module.rgroup-n01662612.location
  rg_name               = module.rgroup-n01662612.rg_name
  subnet_name           = "n01662612-subnet"
  subnet_address_prefix = ["10.0.1.0/24"]
  nsg_name              = "n01662612-nsg"
}

module "common-n01662612" {
  source    = "./modules/common-n01662612"
  law_name  = "n01662612-law"
  log_sku   = "PerGB2018"
  retention = 30
  location  = module.rgroup-n01662612.location
  rg_name   = module.rgroup-n01662612.rg_name
  rsv_name  = "n01662612-rsv"
  vault_sku = "Standard"
  sa_name   = "n01662612sa"
}

module "vmlinux-n01662612" {
  source                = "./modules/vmlinux-n01662612"
  availability_set_name = "n01662612-linux-avset"
  location              = module.rgroup-n01662612.location
  rg_name               = module.rgroup-n01662612.rg_name
  vm_name = {
    "lnx-n01662612v1" = "vm1dns",
    "lnx-n01662612v2" = "vm2dns",
    "lnx-n01662612v3" = "vm3dns"
  }
  admin_username                       = "n01662612-linux-user"
  subnet_id                            = module.network-n01662612.subnet_id
  boot_diagnostics_storage_account_uri = module.common-n01662612.storage_account_primary_blob_endpoint
}

module "vmwindows-n01662612" {
  source                               = "./modules/vmwindows-n01662612"
  resource_group_name                  = module.rgroup-n01662612.rg_name
  vm_name                              = "n01662612"
  location                             = module.rgroup-n01662612.location
  availability_set_name                = "n01662612-windows-avset"
  vm_count                             = 1
  vm_size                              = "Standard_B1ms"
  admin_username                       = "n01662612"
  admin_password                       = "_z7Urg.?A}DExkp"
  subnet_id                            = module.network-n01662612.subnet_id
  boot_diagnostics_storage_account_uri = module.common-n01662612.storage_account_primary_blob_endpoint
}

module "datadisk-n01662612" {
  source         = "./modules/datadisk-n01662612"
  disk_count     = 4
  vm_name        = concat(module.vmlinux-n01662612.vm_info.hostname, module.vmwindows-n01662612.vm_info.hostname)
  linux_vm_ids   = module.vmlinux-n01662612.vm_info.linux_vm_ids
  windows_vm_ids = module.vmwindows-n01662612.vm_info.windows_vm_id
  location       = module.rgroup-n01662612.location
  rg_name        = module.rgroup-n01662612.rg_name
}

module "loadbalancer-n01662612" {
  source                = "./modules/loadbalancer-n01662612"
  loadbalancer_name     = "assignmentllb"
  location              = module.rgroup-n01662612.location
  rg_name               = module.rgroup-n01662612.rg_name
  vm_name               = module.vmlinux-n01662612.vm_info.hostname
  network_interface_ids = module.vmlinux-n01662612.vm_info.linux_network_ids
}

module "database-n01662612" {
  source              = "./modules/database-n01662612"
  location            = module.rgroup-n01662612.location
  resource_group_name = module.rgroup-n01662612.rg_name
  admin_username      = "n01662612"
  admin_password      = "_z7Urg.?A}DExkp"
  db_server_name      = "n01662612-postgresql-server"
  db_sku_name         = "B_Gen5_2"
  db_version          = "11"
}

resource "null_resource" "ansible_provisioner" {
  provisioner "local-exec" {
    command = "ansible-playbook -i ~/automation/ansible/hosts ~/automation/ansible/n01662612-playbook.yml"
  }

  depends_on = [module.vmlinux-n01662612, module.vmwindows-n01662612]

  triggers = {
    always_run = timestamp()
  }
}
