output "instance_ips" {
  value = "${join(",", opentelekomcloud_compute_instance_v2.ecs.*.access_ip_v4)}"
}
