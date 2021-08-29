resource "aws_instance" "server" {
  ami = var.ami
  instance_type = var.instance_type
  key_name = module.key_pair.key_name
}

resource "tls_private_key" "example" {
  algorithm   = "ECDSA"
  ecdsa_curve = "P384"
}

module "key_pair" {
  source = "terraform-aws-modules/key-pair/aws"
  key_name   = "${var.student_id}}-key"
  public_key = tls_private_key.this.public_key_openssh
}

output "private_key" {
  value = key_pair.private_key_pem
}

