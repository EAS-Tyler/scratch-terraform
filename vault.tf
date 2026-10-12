provider "vault" {}

ephemeral "vault_kv_secret_v2" "harness" {
  mount = "secret"
  name  = "harness"
}