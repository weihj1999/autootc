
# Using cloud-init in Terraform

## Requirments
This example also using Template provider to load local configuration into terraform

## Implementation

1. Using Template

provider.tf<br>

```hcl
provider "template" {
  version = "~> 1.0"
}

```
2. Loading data from local cloudinit config init.tpl
data.tf<br>
```hcl
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
```

3. Render cloudinit config for instance
main.tf<br>
```hcl
resource "opentelekomcloud_compute_instance_v2" "ecs" {
  ...
  #user_data       = "${file("web.conf")}"
  user_data       = "${element(data.template_cloudinit_config.config.*.rendered, count.index)}"
  ...
}

```

## How to Run 
```bash
$terraform init
$terraform plan
$terraform apply
$terrafrom destroy
```
## In addtion
1. This is a powerful framework ( I am used to call it as a framework), you can focus on your code work in the init.tpl. 

## Contact
[Hongjin WEI](https://github.com/weihj1999), weihongjin@huawei.com
