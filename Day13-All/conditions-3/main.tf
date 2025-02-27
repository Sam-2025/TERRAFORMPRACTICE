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
  default     = "" # wrong region not in condition
  description = "Instance type"
  validation {
    condition     = var.instance-type == "t2.micro" || var.instance-type == "t3.micro"
    error_message = "wrong instance_type selected ! "
  }
}

#=================================== resource instance =========================================
provider "aws" {

}
resource "aws_instance" "ec2" {
  ami           = var.image
  key_name      = var.key
  instance_type = var.instance-type
  subnet_id     = var.subnet
  tags = {
    Name = var.name
  }
}

#=====================================================================================================================================