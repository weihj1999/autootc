resource "opentelekomcloud_vpc_peering_connection_v2" "peering" {
  name = "${var.peer_conn_name}"
  vpc_id = "${var.local_vpc_id}"
  peer_vpc_id = "${var.peer_vpc_id}"
}

resource "opentelekomcloud_vpc_route_v2" "local_route" {
  type       = "peering"
  nexthop    = "${opentelekomcloud_vpc_peering_connection_v2.peering.id}"
  destination = "${var.peer_cidr}"
  vpc_id = "${var.local_vpc_id}"
}

resource "opentelekomcloud_vpc_route_v2" "peer_route" {
  type       = "peering"
  nexthop    = "${opentelekomcloud_vpc_peering_connection_v2.peering.id}"
  destination = "${var.local_cidr}"
  vpc_id = "${var.peer_vpc_id}"
}

