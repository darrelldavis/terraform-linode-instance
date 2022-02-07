
locals {
  ssh_pubkey_fromfile     = fileexists(var.ssh_public_key_file) ? [ chomp(file(var.ssh_public_key_file)) ] : []
  ssh_privatekey_fromfile = fileexists(var.ssh_private_key_file) ? chomp(file(var.ssh_private_key_file)) : ""
  _authorized_keys        = length(var.authorized_keys) > 0 ? var.authorized_keys : local.ssh_pubkey_fromfile
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

  authorized_keys  = local._authorized_keys
  authorized_users = var.authorized_users
  root_pass        = length(var.root_pass) > 0 ? var.root_pass : random_password.password[0].result

  stackscript_id   = var.stackscript_id
  stackscript_data = var.stackscript_data

}

resource "null_resource" "provisioner" {
  triggers = {
    instance_ids = join(",", linode_instance.this.*.ip_address)
  }

  connection {
    type        = var.provisioner_connection_type
    user        = var.provisioner_connection_user
    private_key = tostring(local.ssh_privatekey_fromfile)
    host        = element(linode_instance.this.*.ip_address, 0)
  }

  provisioner "remote-exec" {
    inline = var.provisioner_inline
  }

  provisioner "remote-exec" {
    script = var.provisioner_script
  }

  provisioner "remote-exec" {
    scripts = var.provisioner_scripts
  }

}
