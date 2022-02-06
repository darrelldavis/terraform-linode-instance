
locals {
  ssh_pubkey_fromfile = fileexists(var.ssh_key_file) ? [ chomp(file(var.ssh_key_file)) ] : []
  ssh_keys = length(var.authorized_keys) > 0 ? var.authorized_keys : local.ssh_pubkey_fromfile
}

resource "random_password" "password" {
  count   = length(var.root_pass) > 0 ? 0 : 1
  length  = 16
  special = true
}

resource "linode_instance" "this" {
  label  = var.label
  image  = var.image
  region = var.region
  type   = var.type

  group = var.group
  tags  = var.tags

  swap_size = var.swap_size

  backups_enabled  = var.backups_enabled
  watchdog_enabled = var.watchdog_enabled

  private_ip = var.private_ip
  #interface  = var.interface

  authorized_keys  = local.ssh_keys
  authorized_users = var.authorized_users
  root_pass        = length(var.root_pass) > 0 ? var.root_pass : random_password.password[0].result

  stackscript_id   = var.stackscript_id
  stackscript_data = var.stackscript_data
}
