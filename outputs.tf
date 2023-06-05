output "first_instance_ip" {
  value = aws_instance.first_instance.public_ip
}


# output "capitalised_names" {
#   value = [for name in var.names : upper(name)]
# }

output "vault_secrets" {
  value = data.vault_generic_secret.demo.data_json
  sensitive = true
}