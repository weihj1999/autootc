output "ipv4_addresses" {
  value = ["${opentelekomcloud_compute_instance_v2.ecs.*.access_ip_v4}"]
}
