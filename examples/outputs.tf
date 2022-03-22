output "infracost_endpoint" {
  value = module.infracost_instance.infracost_endpoint
}

output "self_hosted_infracost_key" {
    value = module.infracost_instance.self_hosted_infracost_key
    sensitive = true
}
