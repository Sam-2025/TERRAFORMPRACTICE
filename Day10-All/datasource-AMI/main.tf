

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
#aws ec2 describe-images --region ap-south-1 --owners amazon --filters "Name=name,Values=al2023-ami-2023.*-x86_64*" "Name=virtualization-type,Values=hvm" "Name=architecture,Values=x86_64" "Name=state,Values=available" --query "Images[*].{ID:ImageId,Name:Name,CreationDate:CreationDate}" --output table
# ---------------------------------------------------------------------------------------------------------
# |                                            DescribeImages                                             |
# +---------------------------+------------------------+--------------------------------------------------+
# |       CreationDate        |          ID            |                      Name                        |
# +---------------------------+------------------------+--------------------------------------------------+
# |  2025-01-28T17:43:40.000Z |  ami-05fa46471b02db0ce |  al2023-ami-2023.6.20250128.0-kernel-6.1-x86_64  |
# |  2025-01-07T22:48:34.000Z |  ami-07b69f62c1d38b012 |  al2023-ami-2023.6.20250107.0-kernel-6.1-x86_64  |
# |  2025-01-24T17:18:05.000Z |  ami-0b7207e48d1b6c06f |  al2023-ami-2023.6.20250123.4-kernel-6.1-x86_64  |
# |  2024-12-06T23:52:14.000Z |  ami-0c4d23e46dc00fbe7 |  al2023-ami-2023.6.20241209.0-kernel-6.1-x86_64  |
# |  2025-02-04T00:02:38.000Z |  ami-0c50b6f7dc3701ddd |  al2023-ami-2023.6.20250203.1-kernel-6.1-x86_64  |
# |  2025-02-20T21:32:31.000Z |  ami-0d682f26195e9ec0f |  al2023-ami-2023.6.20250218.2-kernel-6.1-x86_64  |
# |  2025-01-16T19:32:28.000Z |  ami-0d2614eafc1b0e4d2 |  al2023-ami-2023.6.20250115.0-kernel-6.1-x86_64  |
# |  2025-02-11T22:03:53.000Z |  ami-0ddfba243cbee3768 |  al2023-ami-2023.6.20250211.0-kernel-6.1-x86_64  |
# |  2024-12-12T08:30:58.000Z |  ami-0fd05997b4dff7aac |  al2023-ami-2023.6.20241212.0-kernel-6.1-x86_64  |
# +---------------------------+------------------------+--------------------------------------------------+
