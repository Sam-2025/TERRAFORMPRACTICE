resource "aws_instance" "kheencho" {
  ami = "ami-0ddfba243cbee3768"
  instance_type = "t2.micro"
  key_name = "Ironman123"
  tags = {
    Name = "import"
  }
}