variable "demo" {
  default = [
    {
      description = "SSH from different sg-source"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/8"]
    },
    {
      description = "HTTP FROM ALL"
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      description = "HTTPS FROM ALL SOURCE"
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      description = "MYSQL FROM BACKEND SERVER SG"
      from_port   = 3306
      to_port     = 3306
      protocol    = "tcp"
      cidr_blocks = ["10.0.0.0/24"]
    }
  ]
}

variable "egress" {
  default = [
    {
      description = "Allow all outbound traffic"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}

provider "aws" {

  # ✅ Add a valid AWS region
}

resource "aws_security_group" "DemoSG" {
  name        = "DEMO_SG"
  description = "for practice"

  # ✅ Correct dynamic ingress block
  dynamic "ingress" {
    for_each = var.demo
    content {
      description = ingress.value.description
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol # ✅ Added missing protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  # ✅ Correct dynamic egress block
  dynamic "egress" {
    for_each = var.egress
    content {
      description = egress.value.description
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
    }
  }
}
/*===========================================================================================================================|
# Original Code (Left)                      | # Updated Code (Right)                                                         |
----------------------------------------------|------------------------------------------------------------------------------|
variable "demo" {                             | variable "demo" {                                                            |
  default = [                                 |   default = [                                                                |
    {                                         |     {                                                                        |
      description = "SSH from different       |       description = "SSH from different                                      |
      from_port   = "22"                      |       from_port   = 22  # ✅ Removed quotes (integer)                        |
      to_port     = "22"                      |       to_port     = 22  # ✅ Removed quotes (integer)
      protocol    = "tcp"                     |       protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/8"]             |       cidr_blocks = ["0.0.0.0/8"]
    },                                        |     },
    {                                         |     {
      description = "HTTP FROM ALL "          |       description = "HTTP FROM ALL "
      from_port   = "80"                      |       from_port   = 80  # ✅ Removed quotes (integer)
      to_port     = "80"                      |       to_port     = 80  # ✅ Removed quotes (integer)
      protocol    = "tcp"                     |       protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]             |       cidr_blocks = ["0.0.0.0/0"]
    },                                        |     },
    {                                         |     {
      description = "HTTPS FROM ALL SOURCE"   |       description = "HTTPS FROM ALL SOURCE"
      from_port   = "443"                     |       from_port   = 443  # ✅ Removed quotes (integer)
      to_port     = "443"                     |       to_port     = 443  # ✅ Removed quotes (integer)
      protocol    = "tcp"                     |       protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]             |       cidr_blocks = ["0.0.0.0/0"]
    },                                        |     },
    {                                         |     {
      description = "MYSQL FROM BACKEND       |       description = "MYSQL FROM BACKEND
      from_port   = "3306"                    |       from_port   = 3306  # ✅ Removed quotes (integer)
      to_port     = "3306"                    |       to_port     = 3306  # ✅ Removed quotes (integer)
      protocol    = "tcp"                     |       protocol    = "tcp"
      cidr_blocks = ["10.0.0.0/24"]           |       cidr_blocks = ["10.0.0.0/24"]
    }                                         |     }
  ]                                           |   ]
}                                             | }
----------------------------------------------|----------------------------------------
variable "egress" {                           | variable "egress" {  # ✅ Changed to a list
  description = "HTTP FROM ALL "              |   default = [
  default = {                                 |     {
    from_port   = "0"                         |       description = "Allow all outbound traffic"
    to_port     = "0"                         |       from_port   = 0  # ✅ Removed quotes (integer)
    protocol    = "-1"                        |       to_port     = 0  # ✅ Removed quotes (integer)
    cidr_blocks = ["0.0.0.0/0"]               |       protocol    = "-1"
  }                                           |       cidr_blocks = ["0.0.0.0/0"]
}                                             |     }
                                              |   ]
----------------------------------------------|----------------------------------------
provider "aws" {                              | provider "aws" {
                                              |   region = "us-east-1"  # ✅ Added valid AWS region
}                                             | }
----------------------------------------|----------------------------------------
resource "aws_security_group" "DemoSG" {      | resource "aws_security_group" "DemoSG" {
  name        = "DEMO_SG"                     |   name        = "DEMO_SG"
  description = "for practice"                |   description = "for practice"
  dynamic "ingress" {                         |   dynamic "ingress" {
    for_each = var.demo                       |     for_each = var.demo
    content {                                 |     content {
      description = ingress.value.description |       description = ingress.value.description
      from_port   = ingress.value.from_port   |       from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port     |       to_port     = ingress.value.to_port
                                              |       protocol    = ingress.value.protocol  # ✅ Added missing protocol
      cidr_blocks = ingress.value.cidr_blocks |       cidr_blocks = ingress.value.cidr_blocks
    }                                         |     }
  }                                           |   }
  dynamic "egress" {                          |   dynamic "egress" {
    for_each = var.egress                     |     for_each = var.egress  # ✅ Now iterates over a list
    content {                                 |     content {
                                              |       description = egress.value.description  # ✅ Added missing description
      from_port   = egress.value.from_port    |       from_port   = egress.value.from_port
      to_port     = egress.value.to_port      |       to_port     = egress.value.to_port
      protocol    = egress.value.protocol     |       protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks  |       cidr_blocks = egress.value.cidr_blocks
    }                                         |     }
  }                                           |   }
}  
==============================================|==========================================================================================                                           | }
*/