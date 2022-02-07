module "muh_linode" {
  source  = "../../.."
  
  # single provisioner script
  provisioner_script = "../files/script1.sh"

}
