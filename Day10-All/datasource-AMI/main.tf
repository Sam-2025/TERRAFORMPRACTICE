#aws ec2 describe-images --region ap-south-1 --owners amazon --filters "Name=name,Values=amzn2-ami-hvm-*" --query "Images[*].{ID:ImageId, Name:Name}" --output table
#aws ec2 describe-images --owners amazon --filters "Name=name,Values=amzn2-ami-hvm-*" "Name=virtualization-type,Values=hvm" --query "Images[*].{ID:ImageId, Name:Name}" --output table
#aws ec2 describe-images --owners amazon --filters "Name=name,Values=amzn2-ami-hvm-*" "Name=root-device-type,Values=ebs" --query "Images[*].{ID:ImageId, Name:Name}" --output table
#calling Default AMI process aas a Data source

data "aws_ami" "amzlinux" {
  most_recent = true
  owners = [ "amazon" ]
  filter {
    name = "name"
    values = [ "amzn2-ami-kernel-5.10-hvm-2.0.20250201.0-x86_64-gp2" ]
  }
  filter {
    name = "root-device-type"
    values = [ "ebs" ]
  }
  filter {
    name = "virtualization-type"
    values = [ "hvm" ]
  }
  filter {
    name = "architecture"
    values = [ "x86_64" ]
  }
}

provider "aws" {
  
}
resource "aws_instance" "instance01" {
  ami = data.aws_ami.amzlinux.id
  key_name = "Ironman123"
  subnet_id = "subnet-0cda5ad3e644c6d65"
  instance_type = "t2.micro"
  tags = {
    Name = "AMI_DATASOURCE"
  }
}
output "AMI_ID" {
  value = data.aws_ami.amzlinux.id
}