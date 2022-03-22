data "http" "myip" {
  url = "https://api.ipify.org"

  request_headers = {
    Accept = "application/text"
  }
}
data "template_file" "user_data" {
  template = file("${path.module}/scripts/instance-setup.yaml")

  vars = {
    infracost_api_key   = "${var.infracost_api_key}"
    self_hosted_api_key = "${random_password.password.result}"
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-*20*-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]
}

data "aws_subnets" "selected" {
  filter {
    name   = "vpc-id"
    values = [var.vpc_id]
  }
}
