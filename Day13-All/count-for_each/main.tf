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
  default = ["FrontEnd" , "DataBase"] 
}

#=========================================== Resource ============================================

resource "aws_instance" "name" {
  ami           = data.aws_ami.ammu.id
  instance_type = var.type
  subnet_id     = data.aws_subnet.test.id
  key_name      = var.key
  for_each      = toset(var.name)
  tags = {
    Name = each.value
  }
}
