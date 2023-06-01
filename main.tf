terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.0.1"
    }
  }
}

provider "aws" {
  region = "eu-west-2"
  access_key = "AKIAWZ637YK626Y6EWX4"
  secret_key = "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"
}

resource "aws_instance" "first_instance" {
  ami = "ami-0e1c5be2aa956338b"
  instance_type = "t2.micro"

  tags = {
    Name = "terraform_1"
  }
}