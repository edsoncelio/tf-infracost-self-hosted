resource "random_password" "password" {
  length  = 32
  special = false
}

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "self-hosted-infracost"

  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  key_name               = var.key_name
  monitoring             = true
  vpc_security_group_ids = data.aws_security_groups.selecteds.ids
  subnet_id              = data.aws_subnets.selected.ids[0]
  user_data              = data.template_file.user_data.rendered

  tags = var.tags
}
