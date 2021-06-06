locals {
  environment = lookup(var.tags, "Envioronment","environment")
  department = lookup(var.tags, "Department","department")
  role = lookup(var.tags, "Role","role")
  id = lookup(var.tags, "ID","id")

  sg_name = "${local.environment}-${local.department}-sg-${local.role}-${local.id}"
}

resource "aws_security_group" "sg" {
  name = local.sg_name
  vpc_id = var.vpc_id
  tags = merge(var.tags,{
    Name = local.sg_name
  })
}

module "allow_all_egress" {
  source            = "./modules/sg-rule"
  security_group_id = aws_security_group.sg.id
  sg_rule_type      = "egress"
  from_port         = 22
  to_port           = 22
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}
