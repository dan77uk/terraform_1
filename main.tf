
# resource "aws_vpc" "first_instance" {
#   cidr_block = "10.0.0.0/16"
# }


# resource "aws_eip_association" "eip_assoc" {
#   instance_id   = aws_instance.first_instance.id
#   allocation_id = aws_eip.terraform_1.id
# }

# resource "aws_eip" "terraform_1" {
#   domain   = "vpc"
# }


