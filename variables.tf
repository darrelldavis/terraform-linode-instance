# See https://www.linode.com/docs/api/linode-instances/#linode-create and https://registry.terraform.io/providers/linode/linode/latest/docs/resources/instance

variable "ssh_public_key_file" {
  description = "File containing your SSH Public Key Fingerprint." 
  default     = "~/.ssh/id_rsa.pub"
}

variable "ssh_private_key_file" {
  description = "File containing your SSH Private Key" 
  default     = "~/.ssh/id_rsa"
}

variable "provisioner_inline" { 
  description = " A list of command strings. They are executed in the order they are provided. "
  default     = [] 
}

variable "provisioner_script" {
  description = "This is a path (relative or absolute) to a local script that will be copied to the remote resource and then executed. This cannot be provided with inline or scripts."
  default = null
}

variable "provisioner_scripts" {
  description = "This is a list of paths (relative or absolute) to local scripts that will be copied to the remote resource and then executed. They are executed in the order they are provided. This cannot be provided with inline or script."
  default = []
}

variable "provisioner_connection_type" { 
  description = "The connection type. Valid values are ssh and winrm." 
  default     = "ssh" 
}

variable "provisioner_connection_user" { 
  description = "The user to use for the connection"
  default = "root" 
}

variable "region" {
  description = "(Required) This is the location where the Linode is deployed. See https://api.linode.com/v4/regions"
  type        = string
  default     = "us-central"
}

variable "type" {
  description = "(Required) The Linode type defines the pricing, CPU, disk, and RAM specs of the instance. See https://api.linode.com/v4/linode/types"
  type        = string
  default     = "g6-nanode-1"
}

variable "label" {
  description = "The Linode's label is for display purposes only. If no label is provided for a Linode, a default will be assigned."
  type        = string
  default     = null
}

variable "group" {
  description = "The display group of the Linode instance."
  type        = string
  default     = null
}

variable "tags" {
  description = "A list of tags applied to this object. Tags are for organizational purposes only."
  type        = list(string)
  default     = []
}

variable "private_ip" {
  description = "If true, the created Linode will have private networking enabled, allowing use of the 192.168.128.0/17 network within the Linode's region. It can be enabled on an existing Linode but it can't be disabled."
  type        = bool
  default     = false
}

variable "alerts" {
  description = "See docs: https://registry.terraform.io/providers/linode/linode/latest/docs/resources/instance#alerts.0.cpu"
  type        = list(any)
  default     = []
}

variable "backups_enabled" {
  description = "If this field is set to true, the created Linode will automatically be enrolled in the Linode Backup service."
  type        = bool
  default     = false
}

variable "watchdog_enabled" {
  description = "The watchdog, named Lassie, is a Shutdown Watchdog that monitors your Linode and will reboot it if it powers off unexpectedly."
  type        = bool
  default     = false
}

variable "interface" {
  description = "A list of network interfaces to be assigned to the Linode on creation."
  type        = list(string)
  default     = []
}

variable "authorized_keys" {
  description = "A list of SSH public keys to deploy for the root user on the newly created Linode. "
  type        = list(string)
  default     = []
}

variable "authorized_users" {
  description = "A list of Linode usernames. If the usernames have associated SSH keys, the keys will be appended to the root user's ~/.ssh/authorized_keys file automatically."
  type        = list(string)
  default     = []
}

variable "root_pass" {
  description = "The initial password for the root user account. If omitted, a random password will be generated but will not be stored in Terraform state."
  type        = string
  default     = ""
}

variable "image" {
  description = "An Image ID to deploy the Disk from. Official Linode Images start with linode/, while your Images start with private/. See https://api.linode.com/v4/images"
  type        = string
  default     = "linode/ubuntu20.04"
}

variable "stackscript_id" {
  description = "The StackScript to deploy to the newly created Linode. If provided, 'image' must also be provided, and must be an Image that is compatible with this StackScript."
  type        = number
  default     = null
}

variable "stackscript_data" {
  description = "An object containing responses to any User Defined Fields present in the StackScript being deployed to this Linode. Only accepted if 'stackscript_id' is given."
  type        = map(any)
  default     = {}
}

variable "swap_size" {
  description = "When deploying from an Image, this field is optional with a Linode API default of 512mb, otherwise it is ignored. This is used to set the swap disk size for the newly-created Linode."
  type        = number
  default     = 512
}

variable "backup_id" {
  description = "A Backup ID from another Linode's available backups."
  type        = number
  default     = null
}

variable "boot_config_label" {
  description = "The Label of the Instance Config that should be used to boot the Linode instance."
  type        = string
  default     = null
}

variable "disk_block" {
  description = "See documentation: https://registry.terraform.io/providers/linode/linode/latest/docs/resources/instance#disk-and-config-arguments"
  type        = list(any)
  default     = []
}

variable "config_block" {
  description = "See documentation: https://registry.terraform.io/providers/linode/linode/latest/docs/resources/instance#disk-and-config-arguments"
  type        = list(any)
  default     = []
}

variable "interface_block" {
  description = "See documentation: https://registry.terraform.io/providers/linode/linode/latest/docs/resources/instance#interface"
  type        = list(any)
  default     = []
}

variable "timeouts_block" {
  description = "See documentation: https://registry.terraform.io/providers/linode/linode/latest/docs/resources/instance#timeouts"
  type        = list(any)
  default     = []
}

variable "provisioner" {
  description = "Optional provisioner"
  type        = string
  default     = ""
}
