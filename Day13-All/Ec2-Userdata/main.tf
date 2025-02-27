provider "aws" {
  
}


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
#================================================== Variables ==================================

variable "key" {
  default = "Ironman123"
}
variable "type" {
  default = "t2.micro"
}
####################################### Different Name Tags ######################################

variable "name" {
  type    = list(string)
  default = ["HTML_SERVER"] 
}

#=========================================== Resource ============================================

resource "aws_instance" "name" {
  ami           = data.aws_ami.ammu.id
  instance_type = var.type
  subnet_id     = data.aws_subnet.test.id
  key_name      = var.key
  associate_public_ip_address = true
  user_data = file("html.sh")
  for_each      = toset(var.name)
  tags = {
    Name = each.value
  }
}
