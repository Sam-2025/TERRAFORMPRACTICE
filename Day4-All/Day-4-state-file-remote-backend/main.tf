resource "aws_instance" "name" {
  ami = var.AMI
  key_name =var.KEYPAIR
  instance_type = var.INSTANCE_TYPE
  subnet_id = var.SUBNET
  tags = {
    Name = var.NAME
  }
}
 
