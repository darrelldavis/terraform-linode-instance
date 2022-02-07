module "muh_linode" {
  source  = "../../.."
  
  # inline list of commands
  provisioner_inline = [ "echo hello" , "echo world" ]

}
