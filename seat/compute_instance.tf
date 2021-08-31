data "aws_vpc" "main" {
  default = true
}

resource "aws_instance" "server" {
  ami = var.ami
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.ssm.id]
  iam_instance_profile = aws_iam_instance_profile.ssm_profile.name
  tags = {
    Name = var.student_id
  }
}

resource "aws_security_group" "ssm" {
  name        = "${var.student_id}}-allow_ssm"
  description = "Allow SSM sessions to be initiated"
  vpc_id      = data.aws_vpc.main.id

  tags = {
    Name = "allow_sm"
  }
}

resource "aws_iam_instance_profile" "ssm_profile" {
  name = "${var.student_id}-profile"
  role = aws_iam_role.instance_profile.name
}

resource "aws_security_group_rule" "example" {
  type              = "egress"
  from_port         = 0
  to_port           = 65535
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.ssm.id
}