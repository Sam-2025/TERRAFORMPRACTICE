variable "index" {
  type = map(string)
  default = {
    22   = "203.0.113.0/24"
    80   = "0.0.0.0/0"
    443  = "0.0.0.0/0"
    3306 = "0.0.0.0/8"
  }
}
resource "aws_security_group" "sample" {
  name = "sample sg3"
  description = "sample sg for multiple source"

  dynamic "ingress" {
    for_each = var.index
    content {
      description = "Allow access to port ${ingress.key}"
      from_port   = ingress.key 
      to_port     = ingress.key
      protocol    = "tcp" 
      cidr_blocks = [ingress.value]

    }
    
  }
  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "sg3"
  }
}