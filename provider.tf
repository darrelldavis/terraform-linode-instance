terraform {
  required_providers {
    linode = {
      source = "linode/linode"
    }
  }
}

provider "linode" {
  token = var.linode_token
}

variable "linode_token" {
  description = "Linode personal access token"
  sensitive   = true
  default     = null
}
