terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.0.1"
    }
  }
}

provider "aws" {
  region     = "eu-west-2"
  # access_key = var.access_key
  # secret_key = var.secret_key
  access_key = data.vault_generic_secret.demo.data["access_key"]
  secret_key = data.vault_generic_secret.demo.data["secret_key"]

}

provider "vault" {
  address = "https://sample-cluster-public-vault-4b504fb4.bf21a3ce.z1.hashicorp.cloud:8200/"
  token   = "hvs.CAESIHnnjOWT4hcU58kPevANC0HpxOHPwE0eeAsEWF1jm59SGicKImh2cy5keDdzR2d2Y1dIZkx2TElxVEV6S0hpcVkueFlzaXIQnQE2"

}

data "vault_generic_secret" "demo" {
  path = "admin/secrets/secret"
}