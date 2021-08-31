locals { timestamp = regex_replace(timestamp(), "[- TZ:]", "") }

source "amazon-ebs" "basic-example" {
  region =  "eu-north-1"
  source_ami =  "ami-07e80d21069d8da7e"
  instance_type =  "t3.micro"
  ami_name =  "seat_template-${local.timestamp}"
  ssh_username = "ec2-user"

}

build {
  sources = [
    "source.amazon-ebs.basic-example"
  ]

  provisioner "file" {
    source = "packer/boto3_example.py"
    destination = "/home/ec2-user/boto3_example.py"
  }
}

