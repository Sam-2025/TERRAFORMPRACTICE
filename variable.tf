variable "ami" {
    description = "for ami id"
    type = string
    default =""
  
}
variable "keypair" {
  description = "keypair"
  type = string
  default = ""
}
variable "subnet" {
    description = "subnet"
    type = string
    default = ""
  
}
variable "type" {
    description = "type"
    type = string
    default = ""
  
}
variable "instance_name" {
  description = "Name of the instance"
  type        = string
  default = ""
}
