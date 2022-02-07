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

And profit!

## Inputs

|Name|Description|Default|Required|
|:--|:--|:--:|:--:|


## Outputs

|Name|Description|
|:--|:--|

## Authors

[Darrell Davis](https://github.com/darrelldavis)

## License
MIT Licensed. See LICENSE for full details.

