resource "random_password" "password" {
  length  = 32
  special = false
}
module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "self-hosted-infracost"

  ami                    = local.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  monitoring             = true
  vpc_security_group_ids = local.vpc_security_group_ids
  subnet_id              = local.subnet_id 
  user_data              = data.template_file.user_data.rendered

  tags = {
    CreatedBy = "Terraform"
    TfVersion = "~>1.0.0"
    Name      = "Self-Hosted Infracost"
  }
}
