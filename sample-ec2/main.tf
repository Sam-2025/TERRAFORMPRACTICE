provider "aws" {
  region = "ap-south-1"
}
resource "aws_instance" "sample" {
  ami = "ami-0d682f26195e9ec0f"
  subnet_id = "subnet-0cb2f698ca5329836"
  key_name = "samkey"
  instance_type = "t3.micro"
  tags = {
    Name = "SCM" 
  }
}
