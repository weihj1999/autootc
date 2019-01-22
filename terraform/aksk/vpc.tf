resource "opentelekomcloud_networking_network_v2" "vpc_network_1" {
  name           = "myvpc-network"
  admin_state_up = "true"
}

resource "opentelekomcloud_networking_subnet_v2" "vpc_subnet_1" {
  name       = "myvpc-subnet"
  network_id = "${opentelekomcloud_networking_network_v2.vpc_network_1.id}"
  cidr       = "192.168.199.0/24"
  ip_version = 4
}

resource "opentelekomcloud_networking_router_v2" "vpc_router_1" {
  name             = "myvpc"
  external_gateway = "0a2228f2-7f8a-45f1-8e09-9039e1d09975"
}

resource "opentelekomcloud_networking_router_interface_v2" "vpc_router_interface_1" {
  router_id = "${opentelekomcloud_networking_router_v2.vpc_router_1.id}"
  subnet_id = "${opentelekomcloud_networking_subnet_v2.vpc_subnet_1.id}"
}
