variable "username" {
  # If you don't fill this in, you will be prompted for it
  default = "changeme"
}

variable "password" {
  # If you don't fill this in, you will be prompted for it
  default = "changeme"
}

variable "domain_name" {
  # If you don't fill this in, you will be prompted for it
  default = "changeme"
}

variable "tenant_name" {
  default = "eu-de"
}

variable "count" {}
variable "instance_name" {}
variable "image_id" {} 
variable "flavor_id" {} 
variable "keypair" {} 
variable "security_group" {}
variable "network_id" {}

variable "azs" {
  description = "Run the cloud server in two availability zones"
  type = "list"
  default = ["eu-de-01", "eu-de-02"]
}



