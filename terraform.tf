terraform {
  required_version = ">= 1.10.0"

  required_providers {
    harness = {
      source  = "harness/harness"
      version = "0.45.9"
    }
    vault = {
      source  = "hashicorp/vault"
      version = "5.12.0"
    }
  }
}