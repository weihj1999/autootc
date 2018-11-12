
# Use Vault for OTC credential in Terraform

## Requirments
In a large scale deployment case, we generally named the ECS instance with a prefix plus index. This is OK. However, what shall we do if we want to name them more meaningfully for effciently management. such as, name them after its' main role

Here is an example how to implement with List in Terraform

## Implementation

Define a name list in variable
```hcl
variable "hostnames" {
  type = "list"
  default = [
    "huey",
    "dewey",
    "louie"
  ]
}
```
Define instance name 
```hcl
resource "opentelekomcloud_compute_instance_v2" "ecs" {
  count           = "${var.count}"
  name            = "${element(var.hostnames, count.index)}"
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
## Next
1. This tips will work better when name to use DNS in your case 

## Contact
[Hongjin WEI](https://github.com/weihj1999), weihongjin@huawei.com
