resource "aws_instance" "test" {
  ami = "ami-554646426445sd4"
  instance_type = "t2.micro"
  key_name = "Ironman123"
  tags = {
    Name = "import"
  }
}
