# terraform-linode-instance
Provision linode instance in Linode. 

References: 

* [https://registry.terraform.io/providers/linode/linode/latest/docs/resources/instance](https://registry.terraform.io/providers/linode/linode/latest/docs/resources/instance)
* [https://www.linode.com/docs/api/linode-instances/#linode-create](https://www.linode.com/docs/api/linode-instances/#linode-create)

EXPERIMENTAL!! Not fully implemented or tested (aside from what's in examples).

## Usage

See [examples](./examples) for example usage. You'll need a [Linode personal access token](https://www.linode.com/docs/api/#section/Personal-Access-Token).

### Using all defaults

#### Providing an SSH Key

To be able to log in to your Linode, you'll need a Public SSH key. There's several ways to provide this for provsioning. By default, this module will look for an SSH pub key in `~/.ssh/id_rsa.pub` and silently pass an empty list if not found. If that exists and contains a valid key, there's nothing else to do but run the terraform below.

A second method is to pass your pub key as a variable by creating a `terraform.tfvars` file, adding it, then running the terraform below. For example:

```
authorized_keys = [ "<YOUR_SSHPUBKEY_FINGERPRINT>" ]
```

A third way is to upload your key to Linode through the console in Profile -> SSH Keys. If using this, create a `terraform.tfvars` file, add the usernames and run the terraform below. For example:

```
authorized_users = [ "<INSERT_USERNAME>" ]
```

#### Provision a linode

Once you've sorted out providing your key, init, plan and apply:

```
export LINODE_TOKEN="<YOUR_TOKEN_HERE>"
terraform init
terraform plan -out=/tmp/tf
terraform apply "/tmp/tf"
```

Assuming you correctly provided an SSH public key you can SSH to the IP shown in outputs:

```
ssh root@XX.XX.XX.XX
```

Profit!

## Providers

| Name | Version |
|------|---------|
| <a name="provider_linode"></a> [linode](#provider\_linode) | 1.25.2 |
| <a name="provider_null"></a> [null](#provider\_null) | 3.1.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.1.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alerts"></a> [alerts](#input\_alerts) | See docs: https://registry.terraform.io/providers/linode/linode/latest/docs/resources/instance#alerts.0.cpu | `list(any)` | `[]` | no |
| <a name="input_authorized_keys"></a> [authorized\_keys](#input\_authorized\_keys) | A list of SSH public keys to deploy for the root user on the newly created Linode. | `list(string)` | `[]` | no |
| <a name="input_authorized_users"></a> [authorized\_users](#input\_authorized\_users) | A list of Linode usernames. If the usernames have associated SSH keys, the keys will be appended to the root user's ~/.ssh/authorized\_keys file automatically. | `list(string)` | `[]` | no |
| <a name="input_backup_id"></a> [backup\_id](#input\_backup\_id) | A Backup ID from another Linode's available backups. | `number` | `null` | no |
| <a name="input_backups_enabled"></a> [backups\_enabled](#input\_backups\_enabled) | If this field is set to true, the created Linode will automatically be enrolled in the Linode Backup service. | `bool` | `false` | no |
| <a name="input_boot_config_label"></a> [boot\_config\_label](#input\_boot\_config\_label) | The Label of the Instance Config that should be used to boot the Linode instance. | `string` | `null` | no |
| <a name="input_config_block"></a> [config\_block](#input\_config\_block) | See documentation: https://registry.terraform.io/providers/linode/linode/latest/docs/resources/instance#disk-and-config-arguments | `list(any)` | `[]` | no |
| <a name="input_disk_block"></a> [disk\_block](#input\_disk\_block) | See documentation: https://registry.terraform.io/providers/linode/linode/latest/docs/resources/instance#disk-and-config-arguments | `list(any)` | `[]` | no |
| <a name="input_group"></a> [group](#input\_group) | The display group of the Linode instance. | `string` | `null` | no |
| <a name="input_image"></a> [image](#input\_image) | An Image ID to deploy the Disk from. Official Linode Images start with linode/, while your Images start with private/. See https://api.linode.com/v4/images | `string` | `"linode/ubuntu20.04"` | no |
| <a name="input_interface"></a> [interface](#input\_interface) | A list of network interfaces to be assigned to the Linode on creation. | `list(string)` | `[]` | no |
| <a name="input_interface_block"></a> [interface\_block](#input\_interface\_block) | See documentation: https://registry.terraform.io/providers/linode/linode/latest/docs/resources/instance#interface | `list(any)` | `[]` | no |
| <a name="input_label"></a> [label](#input\_label) | The Linode's label is for display purposes only. If no label is provided for a Linode, a default will be assigned. | `string` | `null` | no |
| <a name="input_linode_token"></a> [linode\_token](#input\_linode\_token) | Linode personal access token | `any` | `null` | no |
| <a name="input_private_ip"></a> [private\_ip](#input\_private\_ip) | If true, the created Linode will have private networking enabled, allowing use of the 192.168.128.0/17 network within the Linode's region. It can be enabled on an existing Linode but it can't be disabled. | `bool` | `false` | no |
| <a name="input_provisioner"></a> [provisioner](#input\_provisioner) | Optional provisioner | `string` | `""` | no |
| <a name="input_provisioner_connection_type"></a> [provisioner\_connection\_type](#input\_provisioner\_connection\_type) | The connection type. Valid values are ssh and winrm. | `string` | `"ssh"` | no |
| <a name="input_provisioner_connection_user"></a> [provisioner\_connection\_user](#input\_provisioner\_connection\_user) | The user to use for the connection | `string` | `"root"` | no |
| <a name="input_provisioner_inline"></a> [provisioner\_inline](#input\_provisioner\_inline) | A list of command strings. They are executed in the order they are provided. | `list` | `[]` | no |
| <a name="input_provisioner_script"></a> [provisioner\_script](#input\_provisioner\_script) | This is a path (relative or absolute) to a local script that will be copied to the remote resource and then executed. This cannot be provided with inline or scripts. | `any` | `null` | no |
| <a name="input_provisioner_scripts"></a> [provisioner\_scripts](#input\_provisioner\_scripts) | This is a list of paths (relative or absolute) to local scripts that will be copied to the remote resource and then executed. They are executed in the order they are provided. This cannot be provided with inline or script. | `list` | `[]` | no |
| <a name="input_region"></a> [region](#input\_region) | (Required) This is the location where the Linode is deployed. See https://api.linode.com/v4/regions | `string` | `"us-central"` | no |
| <a name="input_root_pass"></a> [root\_pass](#input\_root\_pass) | The initial password for the root user account. If omitted, a random password will be generated but will not be stored in Terraform state. | `string` | `""` | no |
| <a name="input_ssh_private_key_file"></a> [ssh\_private\_key\_file](#input\_ssh\_private\_key\_file) | File containing your SSH Private Key | `string` | `"~/.ssh/id_rsa"` | no |
| <a name="input_ssh_public_key_file"></a> [ssh\_public\_key\_file](#input\_ssh\_public\_key\_file) | File containing your SSH Public Key Fingerprint. | `string` | `"~/.ssh/id_rsa.pub"` | no |
| <a name="input_stackscript_data"></a> [stackscript\_data](#input\_stackscript\_data) | An object containing responses to any User Defined Fields present in the StackScript being deployed to this Linode. Only accepted if 'stackscript\_id' is given. | `map(any)` | `{}` | no |
| <a name="input_stackscript_id"></a> [stackscript\_id](#input\_stackscript\_id) | The StackScript to deploy to the newly created Linode. If provided, 'image' must also be provided, and must be an Image that is compatible with this StackScript. | `number` | `null` | no |
| <a name="input_swap_size"></a> [swap\_size](#input\_swap\_size) | When deploying from an Image, this field is optional with a Linode API default of 512mb, otherwise it is ignored. This is used to set the swap disk size for the newly-created Linode. | `number` | `512` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A list of tags applied to this object. Tags are for organizational purposes only. | `list(string)` | `[]` | no |
| <a name="input_timeouts_block"></a> [timeouts\_block](#input\_timeouts\_block) | See documentation: https://registry.terraform.io/providers/linode/linode/latest/docs/resources/instance#timeouts | `list(any)` | `[]` | no |
| <a name="input_type"></a> [type](#input\_type) | (Required) The Linode type defines the pricing, CPU, disk, and RAM specs of the instance. See https://api.linode.com/v4/linode/types | `string` | `"g6-nanode-1"` | no |
| <a name="input_watchdog_enabled"></a> [watchdog\_enabled](#input\_watchdog\_enabled) | The watchdog, named Lassie, is a Shutdown Watchdog that monitors your Linode and will reboot it if it powers off unexpectedly. | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_backups"></a> [backups](#output\_backups) | Information about this Linode's backups status |
| <a name="output_id"></a> [id](#output\_id) | Linode id |
| <a name="output_ip_address"></a> [ip\_address](#output\_ip\_address) | A string containing the Linode's public IP address. |
| <a name="output_ipv4"></a> [ipv4](#output\_ipv4) | This Linode's IPv4 Addresses. |
| <a name="output_ipv6"></a> [ipv6](#output\_ipv6) | This Linode's IPv6 SLAAC addresses. |
| <a name="output_label"></a> [label](#output\_label) | Linode label |
| <a name="output_private_ip_address"></a> [private\_ip\_address](#output\_private\_ip\_address) | This Linode's Private IPv4 Address, if enabled. |
| <a name="output_specs"></a> [specs](#output\_specs) | Specs |
| <a name="output_status"></a> [status](#output\_status) | The status of the instance, indicating the current readiness state. |

## Attributions

README.md formatting using [terraform-docs](https://github.com/terraform-docs/terraform-docs)

## Authors

[Darrell Davis](https://github.com/darrelldavis)

## License
MIT Licensed. See LICENSE for full details.

