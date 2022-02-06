module "muh_linode" {
  #source  = "darrelldavis/terraform-linode-instance"
  source  = "../.."
  
  authorized_keys  = var.authorized_keys
  authorized_users = var.authorized_users

}
