variable "linode_api_token" {
  description = "The Linode API Personal Access Token."
}

variable "root_pass" {}

variable "server_type" {
  description = ""
  default = "g6-standard-4"
}

variable "client_type" {
  description = ""
  default = "g6-standard-4"
}

variable "server_count" {
  default = 1
}

variable "client_count" {
  default = 1
}

variable "image" {
  description = ""
  default = "linode/ubuntu22.04"
}

variable "region" {
  description = "The name of the region in which to deploy instances."
  default = "eu-central"
}
