resource "opentelekomcloud_compute_instance_v2" "myserver" {
  name            = "myserver"
  # We will use image:  Standard_CentOS_7_latest
  image_id        = "6d20bfd7-449d-401a-9758-5cebd5135b83"
  flavor_id       = "s2.medium.1"
  key_pair        = "KeyPair-bf25"
  security_groups = ["default"]
  
  tag = {
    foo = "bar"
    key = "value"
  }

  network {
    uuid    = "${opentelekomcloud_networking_network_v2.vpc_network_1.id}"
  }
  depends_on = ["opentelekomcloud_networking_router_interface_v2.vpc_router_interface_1","opentelekomcloud_blockstorage_volume_v2.volume_1"]
}

resource "opentelekomcloud_compute_volume_attach_v2" "attached" {
  instance_id = "${opentelekomcloud_compute_instance_v2.myserver.id}"
  volume_id = "${opentelekomcloud_blockstorage_volume_v2.volume_1.id}"
}
