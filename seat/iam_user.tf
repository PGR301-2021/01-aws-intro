resource "aws_iam_user" "user" {
  name = var.student_id
}

resource "aws_iam_access_key" "user" {
  user = aws_iam_user.user.name
}

data "aws_iam_policy_document" "instance-assume-role-policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "instance_profile" {
  name               = "${var.student_id}-ssm-role"
  managed_policy_arns = ["arn:aws:iam::aws:policy/AmazonSSMFullAccess"]
  assume_role_policy = data.aws_iam_policy_document.instance-assume-role-policy.json
}