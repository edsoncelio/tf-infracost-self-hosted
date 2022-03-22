module "sg_endpoint" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 4.0"

  name        = "infracost-sg-endpoint"
  description = "Security Group for Infracost endpoint"
  vpc_id      = var.vpc_id

  ingress_with_cidr_blocks = [
    {
      from_port   = 4000
      to_port     = 4000
      protocol    = "tcp"
      description = "API endpoint rule"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      rule        = "ssh-tcp"
      cidr_blocks = "${data.http.myip.body}/32"
    },
  ]

  tags = {
    CreatedBy = "Terraform"
    TfVersion = "~>1.0.0"
    Name      = "Self-Hosted Infracost"
  }
}
module "sg_ssh" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 4.0"

  name        = "infracost-sg-ssh"
  description = "Security group for SSH"
  vpc_id      = var.vpc_id

  ingress_with_cidr_blocks = [
    {
      rule        = "ssh-tcp"
      cidr_blocks = "${data.http.myip.body}/32"
    },
  ]
  egress_cidr_blocks = ["0.0.0.0/0"]
  egress_rules       = ["http-80-tcp", "https-443-tcp"]

  tags = {
    CreatedBy = "Terraform"
    TfVersion = "~>1.0.0"
    Name      = "Self-Hosted Infracost"
  }
}

