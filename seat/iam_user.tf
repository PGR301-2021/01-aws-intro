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

resource "aws_iam_user_policy" "newemp_policy" {
    name = "${var.student_id}-policy"
    user = var.student_id
    policy = <<EOF
{
      "Version": "2012-10-17",
      "Statement": [
        {
          "Action": [
            "ec2:Describe*"
          ],
          "Effect": "Allow",
          "Resource": "*"
        }
      ]
}
EOF
}


resource "aws_iam_role" "instance_profile" {
  name               = "${var.student_id}-ssm-role"
  managed_policy_arns = ["arn:aws:iam::aws:policy/AmazonSSMFullAccess"]
  assume_role_policy = data.aws_iam_policy_document.instance-assume-role-policy.json
}