variable "user_name" {}
variable "password" {}
variable "domain_name" {}
variable "endpoint" {
  default = "https://iam.eu-de.otc.t-systems.com:443/v3"
}

variable "count" {}
variable "image_id" {}
variable "tenant_name" {}
variable "flavor_id" {}
variable "keypair" {}
variable "security_group" {}
variable "network_id" {}

variable "azs" {
  description = "Run the cloud server in two availability zones"
  type = "list"
  default = ["eu-de-01", "eu-de-02"]
}

variable "hostnames" {
  type = "list"
  default = [
    "huey",
    "dewey",
    "louie"
  ]
}
