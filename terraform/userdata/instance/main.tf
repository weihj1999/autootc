resource "opentelekomcloud_compute_instance_v2" "ecs" {
  count           = "${var.count}"
  name            = "${element(var.hostnames, count.index)}"
  image_id        = "${var.image_id}"
  flavor_id       = "${var.flavor_id}"
  key_pair        = "${var.keypair}"
  security_groups = ["${var.security_group}"]
  availability_zone = "${element(var.azs, count.index)}"
  network {
    uuid = "${var.network_id}"
  }
  #user_data       = "${file("web.conf")}"
  user_data       = "${element(data.template_cloudinit_config.config.*.rendered, count.index)}"
  
  tags  = ["managedby.terraform"]
}

