output "infracost_endpoint" {
  description = "URL to infracost endpoint"
  value       = "${module.ec2_instance.public_ip}:4000"
}

output "self_hosted_infracost_key" {
  description = "self hosted api key"
  value       = random_password.password.result
  sensitive   = true
}
