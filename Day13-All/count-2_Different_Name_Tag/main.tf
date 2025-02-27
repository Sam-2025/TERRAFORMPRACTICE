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
  default = ["FrontEnd","DataBase"] #removed BackEnd
}

#=========================================== Resource ============================================

resource "aws_instance" "name" {
  ami           = data.aws_ami.ammu.id
  instance_type = var.type
  subnet_id     = data.aws_subnet.test.id
  key_name      = var.key
  count         = length(var.name)
  /* crates 3 resources with different names But Disadvantage is when 'destroy for example : Backend'
    it will delete first DataBase and rename & renames to The Backend To DataBase so it will delete according to count */

  tags = {
    Name = var.name[count.index]     
  }
}
