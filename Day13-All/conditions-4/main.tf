#========================================= variables ============================================

variable "image" {

}
variable "key" {

}
variable "subnet" {

}
variable "name" {

}
#=================================== condition variable ======================================

variable "instance-type" {
  type        = string
  default     = "t2.micro" # correct
  description = "Instance type"
}

#=================================== resource instance =========================================

provider "aws" {

}
resource "aws_instance" "ec2" {
  ami           = var.image
  key_name      = var.key
  instance_type = var.instance-type
  count         = var.instance-type == "t2.micro" ? 1 : 0
  subnet_id     = var.subnet
  tags = {
    Name = var.name
  }
}

#=====================================================================================================================================