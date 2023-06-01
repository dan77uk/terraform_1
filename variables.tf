variable "security_group_vpn_ip" {}
variable "instance_type_size" {}
variable "access_key" {}
variable "secret_key" {}
# variable "instance_tags" {
#   description = "Project Name and Build Version"
#   type = number
# }

# Lists and Maps
# variable "instance_map" {
#   type = map
#   default = {
#     eu1m = "t1.micro"
#     eu2m = "t2.micro"
#   }
# }
variable "instance_list" {
  type = list
  default = ["t1.micro","t2.micro"]
}

variable "name_list" {
  type = list
  default = ["dev_instance", "test_instance", "prod_instance"]
}

variable "is_test_env" {
  type = string
  description = "Is this a production environment (yes/no)?"
}