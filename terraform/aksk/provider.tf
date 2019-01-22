provider "opentelekomcloud" {
  access_key  = "${var.access_key}"
  secret_key  = "${var.secret_key}"
  tenant_name = "${var.tenant_name}"
  domain_name = "${var.domain_name}"
  auth_url    = "${var.endpoint}"
}

