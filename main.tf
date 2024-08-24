provider "aws" {
  region = "us-west-2"
}

data "aws_ami" "Packer-terraform-ami" {
  owners      = ["self"] 
  most_recent = true

  filter {
    name   = "name"
    values = ["my-ubuntu-*"]
  }
}

resource "aws_instance" "packer" {
  ami           = data.aws_ami.Packer-terraform-ami.id
  instance_type = "t2.micro"

  tags = {
    Name = "Packer-Ami"
  }
}

output "ami-id" {
  value = data.aws_ami.Packer-terraform-ami.id  
}

output "ami-name" {
  value = data.aws_ami.Packer-terraform-ami.name 
}
