provider "aws" {

}
locals {
  keypair  = "Ironman123"
  typeinst = "t2.medium"
  tag      = "J-E-N-K-I-N-S"
}
data "aws_ami" "fardeen" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["al2023-ami-2023.6.20250218.2-kernel-6.1-x86_64"]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]

  }
}
data "aws_subnet" "mumb" {
  filter {
    name   = "tag:Name"
    values = ["test"]
  }

}
output "aws_ami" {
  value = data.aws_ami.fardeen.image_id
}
output "awssubnt" {
  value = data.aws_subnet.mumb.id
}
output "awssubnttag" {
  value = data.aws_subnet.mumb.tags
}
output "awsinst" {
  value = aws_instance.jenkins.id
}

resource "aws_instance" "jenkins" {
  ami           = data.aws_ami.fardeen.id
  subnet_id     = data.aws_subnet.mumb.id
  key_name      = local.keypair
  instance_type = local.typeinst
  associate_public_ip_address = true
  user_data     = file("jenkin.sh")
  tags = {
    Name = local.tag
  }
}