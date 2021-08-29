source "amazon-ebs" "basic-example" {
  region =  "eu-north-1"
  source_ami =  "ami-0223e7391593c3843"
  instance_type =  "t2.micro"
  ssh_username =  "ubuntu"
  ami_name =  "packer_tag_example {{timestamp}}"
  tags = {
    OS_Version = "Ubuntu"
    Release = "Latest"
    Base_AMI_Name = "{{ .SourceAMIName }}"
    Extra = "{{ .SourceAMITags.TagName }}"
  }
}

build {
  sources = [
    "source.amazon-ebs.basic-example"
  ]

  provisioner "file" {
    source = "packer/boto3_example.py"
    destination = "boto3_example.py"
  }
}

