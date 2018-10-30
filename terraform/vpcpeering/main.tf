module "vpc-10" {
  source = "./network"
  vpc_name = "vpc10"
  vpc_cidr = "10.10.0.0/16"
  subnet_name = "subnet10"
  subnet_cidr = "10.10.10.0/24"
  subnet_gateway_ip = "10.10.10.1"
}

module "vpc-172" {
  source = "./network"
  vpc_name = "vpc172"
  vpc_cidr = "172.16.0.0/16"
  subnet_name = "subnet172"
  subnet_cidr = "172.16.0.0/24"
  subnet_gateway_ip = "172.16.0.1"
}

module "vpc-peering-10-172" {
  source = "./connect"
  peer_conn_name = "peering-10-172"
  peer_cidr =  "${module.vpc-172.vpc_cidr}"
  peer_vpc_id = "${module.vpc-172.vpc_id}"
  local_cidr = "${module.vpc-10.vpc_cidr}"
  local_vpc_id = "${module.vpc-10.vpc_id}"
}

module "instance-10" {
  source = "./instance"
  count = "2"
  instance_name = "instance10"
  #Standard_CentOS_7_latest
  image_id = "ba8b7d4c-e8af-4ef3-8ce4-d40e41e15e4f"
  flavor_id = "s2.xlarge.4"
  keypair = "nor1"
  security_group = "default"
  network_id = "${module.vpc-10.subnet_id}"
}

module "instance-172" {
  source = "./instance"
  count = "2"
  instance_name = "instance172"
  #Standard_CentOS_7_latest
  image_id = "ba8b7d4c-e8af-4ef3-8ce4-d40e41e15e4f"
  flavor_id = "s2.xlarge.4"
  keypair = "nor1"
  security_group = "default"
  network_id = "${module.vpc-172.subnet_id}"
}

