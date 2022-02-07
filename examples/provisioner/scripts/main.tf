module "muh_linode" {
  source  = "../../.."
  
  # multiple provisioner scripts
  provisioner_scripts = [ "../files/script1.sh", "../files/script2.sh", "../files/script3.sh" ]

}
