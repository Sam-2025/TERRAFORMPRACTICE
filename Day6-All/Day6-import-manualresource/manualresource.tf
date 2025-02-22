resource "aws_instance" "test" {
  ami = "ami-0ddf9922794873d"
  instance_type = "t2.micro"
  key_name = "keypair"
  tags = {
    Name = "import"
  }
}
