module "muh_linode" {
  source  = "../.."
  
  # list of commands
  provisioner_inline = [ "echo hello" ]

  # single provisioner script
  provisioner_script = "./script1.sh"

  # multiple provisioner scripts
  provisioner_scripts = [ "./script1.sh", "./script2.sh", "./script3.sh" ]

}
