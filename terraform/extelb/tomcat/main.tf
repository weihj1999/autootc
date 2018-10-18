
resource "opentelekomcloud_blockstorage_volume_v2" "az01-webtomcat-sys-vol" {
  count    = "${var.count}"
  name     = "${element(var.azs, count.index)}-webtomcat-sys-vol-${count.index}"
  size     = 10
  image_id = "${var.image_id}"
  availability_zone = "${element(var.azs, count.index)}"
  volume_type = "SATA"
  tags {
    ETYPE = "UAT"
    VTYPE = "System"
  }
}

resource "opentelekomcloud_compute_instance_v2" "az01-webtomcat" {
   count           = "${var.count}"
   name            = "${element(var.azs, count.index)}-webtomcat${count.index}"
   flavor_name     = "${var.flavor_name}"
   key_pair        = "nor"
   availability_zone = "${element(var.azs, count.index)}"
   security_groups = ["default"]
   
   tags = ["ETYPE.UAT","OS.CentOS73"]

   network {
     uuid           = "${var.existing_private_net_id}"
   }

   block_device {
     uuid = "${element(opentelekomcloud_blockstorage_volume_v2.az01-webtomcat-sys-vol.*.id,count.index)}"
     source_type           = "volume"
     boot_index            = 0
     destination_type      = "volume"
     delete_on_termination = false
   }
   provisioner "local-exec" {
     command = "echo -e ${self.network.0.fixed_ip_v4} ansible_ssh_private_key_file=~/.ssh/id_rsa >> /home/linux/extelb/tomcat/hosts"
   }
   provisioner "local-exec" {
     when = "destroy"
     command = "sed -i '/${self.network.0.fixed_ip_v4}/d' /home/linux/extelb/tomcat/hosts"
   }
}

resource "opentelekomcloud_elb_loadbalancer" "tomcat_ext_elb" {
  name = "tomcat-ext-elb"
  description = "elb for tomcat(external)"
  type = "External"
  vpc_id = "${var.vpc_id}"
  bandwidth = 5
  admin_state_up = true
}


resource "opentelekomcloud_elb_listener" "tomcat_ext_listener" {
  name             = "tomcat_ext_listener"
  protocol         = "TCP"
  protocol_port    = 80
  backend_protocol = "TCP"
  backend_port     = 8080
  lb_algorithm     = "roundrobin"
  loadbalancer_id  = "${opentelekomcloud_elb_loadbalancer.tomcat_ext_elb.id}"
}

resource "opentelekomcloud_elb_health" "tomcat_health" {
  listener_id = "${opentelekomcloud_elb_listener.tomcat_ext_listener.id}"
  healthcheck_protocol = "HTTP"
  healthy_threshold = 5
  healthcheck_timeout = 25
  healthcheck_interval = 3
  healthcheck_uri = "/"
  timeouts {
    create = "5m"
    update = "5m"
    delete = "5m"
  }
  depends_on =["opentelekomcloud_elb_listener.tomcat_ext_listener"]
}

resource "opentelekomcloud_elb_backend" "tomcat_ext_backend" {
  count = "${var.count}"
  address = "${element(opentelekomcloud_compute_instance_v2.az01-webtomcat.*.access_ip_v4, count.index)}"
  listener_id = "${opentelekomcloud_elb_listener.tomcat_ext_listener.id}"
  server_id = "${element(opentelekomcloud_compute_instance_v2.az01-webtomcat.*.id, count.index)}"
  depends_on =["opentelekomcloud_elb_listener.tomcat_ext_listener"]
}

resource "null_resource" "ansible_ansible" {
   depends_on = ["opentelekomcloud_compute_instance_v2.az01-webtomcat"]
   provisioner "local-exec" {
     command = "sleep 120 && ansible-playbook -i /home/linux/extelb/tomcat/hosts /home/linux/extelb/tomcat/site.yml -vv"
  }
}
