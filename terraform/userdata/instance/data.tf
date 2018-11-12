data "template_file" "init" {
  template = "${file("${path.module}/init.tpl")}"
  count = "${length(var.hostnames)}"

  vars {
    fqdn = "${element(var.hostnames, count.index)}"
  }
}

data "template_cloudinit_config" "config" {
  gzip = false
  base64_encode = false

  count = "${length(var.hostnames)}"

  part {
    filename = "init.cfg"
    content_type = "text/cloud-config"
    content = "${element(data.template_file.init.*.rendered, count.index)}"
  }
}
