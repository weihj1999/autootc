
# How to use Vault in Terraform

## Precondition
1. Vault server available<br> 
2. Verify Vault 
```bash
$ vault status
$ vault kv put secret/foo hello=world
```

## Run 
```bash
$terraform init
$terraform plan
$terraform apply
$terrafrom destroy
```
## Inaddition
1. This example just show how to create secret in Vault with Terraform, other backends can also be supported, we will discuss more in the future 
2. To understand vaule quickly, I recommend to read vault for a little time, it's not diffcult.
https://learn.hashicorp.com/vault/

## Contact
[Hongjin WEI](https://github.com/weihj1999), weihongjin@huawei.com
