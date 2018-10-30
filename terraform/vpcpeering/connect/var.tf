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

variable "endpoint" {
  default = "https://iam.eu-de.otc.t-systems.com:443/v3"
}

variable "peer_conn_name" {}
variable "peer_cidr" {}
variable "peer_vpc_id" {}
variable "local_cidr" {}
variable "local_vpc_id" {}



