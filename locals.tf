locals {
  vpc_security_group_ids = [module.sg_endpoint.security_group_id, module.sg_ssh.security_group_id]
  subnet_id              = var.subnet_id != null ? var.subnet_id : data.aws_subnets.selected.ids[0]
  ami                    = var.ami_id == null ? data.aws_ami.ubuntu.id : var.ami_id
}
