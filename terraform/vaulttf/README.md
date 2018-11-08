
# Use Vault for OTC credential in Terraform

## Precondition
1. Vault server available<br> 
2. Add your OTC credential to Vault secret kv<br>
```bash
$vault kv put secret/otc username=xxxxx password=xxxxx domain=OTC0000000000xxxxxxxxxx
```

## Run 
```bash
$terraform init
$terraform plan
$terraform apply
$terrafrom destroy
```
## Next
1. These credential can also be readable in state, so we are recommend to use remote state for your production. 
2. Terrahelp is also an open tools for output encrytion
https://github.com/opencredo/terrahelp
