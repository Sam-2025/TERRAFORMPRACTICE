
resource "aws_instance" "name" {
  ami = var.ami
  key_name = var.keypair
  subnet_id = var.subnet
  instance_type = var.type
  tags = {
  name = var.instance_name
  }
}