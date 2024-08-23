provider "aws" {
  region = "us-west-2"
}

data "aws_ami" "packerA_ami" {
  owners      = ["self"] 
  most_recent = true
}

resource "aws_instance" "example" {
  ami           = data.aws_ami.packerA_ami.id
  instance_type = "t2.micro"

  tags = {
    Name = "Packer-Terraform-Example"
  }
}