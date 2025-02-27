#================================================= Data Source =========================================

data "aws_subnet" "test" {
  filter {
    name   = "tag:Name"
    values = ["test"]
  }
}
data "aws_ami" "ammu" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
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
    name   = "name"
    values = ["al2023-ami-2023.6.20250218.2-kernel-6.1-x86_64"]
  }
}
