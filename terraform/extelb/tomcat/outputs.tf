output "public_ips" {
  value = ["${opentelekomcloud_elb_loadbalancer.tomcat_ext_elb.vip_address}"]
}
