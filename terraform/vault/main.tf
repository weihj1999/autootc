provider "vault" {

  address = "http://127.0.0.1:8200"
  skip_tls_verify = true
  token = "s.5PfUjy4Br1g78BinmvjmbO7N"
}

resource "vault_generic_secret" "example" {
  path = "secret/foo"

  data_json = <<EOT
  {
    "foo":   "bar",
    "pizza": "cheese"
  }
  EOT
}

data "vault_generic_secret" "example" {
  path = "secret/foo"
}

output foo-value {
  value = "${data.vault_generic_secret.example.data["foo"]}"
}

output pizza-value {
  value = "${data.vault_generic_secret.example.data["pizza"]}"
}


