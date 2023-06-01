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
  access_key = var.access_key
  secret_key = var.secret_key
}

resource "aws_instance" "first_instance" {
  ami = "ami-0e1c5be2aa956338b"
  instance_type = var.instance_type_size
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  tags = {
    Name = "terraform_1"
  }
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.first_instance.id
  allocation_id = aws_eip.terraform_1.id
}

resource "aws_eip" "terraform_1" {
  domain   = "vpc"
}

resource "aws_security_group" "allow_tls" {
  name = "allow_tls"

  ingress {
    description = "TLS from VPC"
    from_port = 443
    to_port = 443
    protocol = "tcp"
    # cidr_blocks = ["${aws_eip.terraform_1.public_ip}/32"]
    cidr_blocks = [var.security_group_vpn_ip]
  }
  ingress {
    description = "TLS from VPC"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    # cidr_blocks = ["${aws_eip.terraform_1.public_ip}/32"]
    cidr_blocks = [var.security_group_vpn_ip]
  }
  ingress {
    description = "TLS from VPC"
    from_port = 53
    to_port = 53
    protocol = "tcp"
    # cidr_blocks = ["${aws_eip.terraform_1.public_ip}/32"]
    cidr_blocks = [var.security_group_vpn_ip]
  }
}

output "first_instance_ip" {
  value = aws_instance.first_instance.public_ip
}

