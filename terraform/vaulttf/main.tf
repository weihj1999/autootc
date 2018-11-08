provider "vault" {
  address = "http://localhost:8200"
  skip_tls_verify = true
  token = "s.5PfUjy4Br1g78BinmvjmbO7N"
}

data "vault_generic_secret" "operator" {
  path = "secret/otc"
}

provider "opentelekomcloud" {
  user_name   = "${data.vault_generic_secret.operator.data["username"]}"
  password    = "${data.vault_generic_secret.operator.data["password"]}"
  tenant_name = "eu-de"
  domain_name = "${data.vault_generic_secret.operator.data["domain"]}"
  auth_url    = "https://iam.eu-de.otc.t-systems.com:443/v3"
}

