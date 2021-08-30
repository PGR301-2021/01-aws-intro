source "amazon-ebs" "basic-example" {
  region =  "eu-north-1"
  source_ami =  "ami-0fce25857d9f86070"
  instance_type =  "t3.micro"
  ami_name =  "seat_template"
  ssh_username = "ec2-user"

}

build {
  sources = [
    "source.amazon-ebs.basic-example"
  ]

  provisioner "file" {
    source = "packer/boto3_example.py"
    destination = "/home/ssm-user/boto3_example.py"
  }
}

