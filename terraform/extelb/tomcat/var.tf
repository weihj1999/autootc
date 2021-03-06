variable "username" {
  default = "changeme"
}

variable "password" {
  default = "changeme"
}

variable "domain_name" {
  default = "changeme"
}

variable "endpoint" {
  default = "https://iam.eu-de.otc.t-systems.com:443/v3"
}

variable "azs" {
  description = "Run the cloud server in two availability zones"
  type = "list"
  default = ["eu-de-01", "eu-de-02"]
}
variable "count" {}
variable "tenant_name" {}
variable "existing_subnet_id" {}
variable "flavor_name" {}
variable "image_id" {}
variable "existing_private_net_id" {}
variable "security_group_id" {}
variable "vpc_id" {}
