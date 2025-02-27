

locals {
  
  machiene_image  = var.machiene_image0
  machiene_type   = var.machiene_type0
  machiene_key    = var.machiene_key0
  machiene_name   = var.machiene_name0
  machiene_subnet = var.machiene_subnet0
}
resource "aws_instance" "demoinstance" {
  ami           = local.machiene_image
  key_name      = local.machiene_key
  instance_type = local.machiene_type
  subnet_id     = local.machiene_subnet
  tags = {
    Name = local.machiene_name
  }
}