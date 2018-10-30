
output "vpc_cidr" {
 value = "${opentelekomcloud_vpc_v1.vpc_v1.cidr}"
}

output "vpc_id" {
  value = "${opentelekomcloud_vpc_v1.vpc_v1.id}"
}

output "subnet_id" {
  value = "${opentelekomcloud_vpc_subnet_v1.subnet_v1.id}"
}
