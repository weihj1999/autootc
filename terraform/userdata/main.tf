provider "vault" {
  address = "http://localhost:8200"
  skip_tls_verify = true
  token = "s.5PfUjy4Br1g78BinmvjmbO7N"
}

data "vault_generic_secret" "operator" {
  path = "secret/otc"
}

module "instance" {
  source = "./instance"
  count = "3"
  user_name   = "${data.vault_generic_secret.operator.data["username"]}"
  password    = "${data.vault_generic_secret.operator.data["password"]}"
  domain_name = "${data.vault_generic_secret.operator.data["domain"]}"
  #Standard_CentOS_7_latest
  image_id = "ba8b7d4c-e8af-4ef3-8ce4-d40e41e15e4f"
  flavor_id = "s2.xlarge.4"
  tenant_name = "eu-de_ansible"
  keypair = "nor"
  security_group = "default"
  network_id = "e3c83074-885b-4b2b-82e0-3acb94a8c26b"
}
