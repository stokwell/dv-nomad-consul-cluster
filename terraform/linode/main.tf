terraform {
  required_providers {
    linode = {
      source = "linode/linode"
      version = "1.27.1"
    }
  }
}

provider "linode" {
  token = var.linode_api_token
}

resource "linode_sshkey" "rsa" {
  label = "foo"
  ssh_key = chomp(file("~/.ssh/linode.pub"))
}

resource "linode_instance" "server-node" {
  count = var.server_count
  tags = ["server"]
  image = var.image
  type = var.server_type
  region = var.region
  authorized_keys  = [linode_sshkey.rsa.ssh_key]
}

resource "linode_instance" "client-node" {
  count = var.client_count
  image = var.image
  tags = ["client"]
  type = var.client_type
  region = var.region
  authorized_keys= [linode_sshkey.rsa.ssh_key]
}
