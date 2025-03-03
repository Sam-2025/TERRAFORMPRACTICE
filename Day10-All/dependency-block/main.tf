provider "aws" {
  
}
resource "aws_instance" "instance01" {
  ami = "ami-0d682f26195e9ec0f"
  key_name = "Ironman123"
  subnet_id = "subnet-0cda5ad3e644c6d65"
  instance_type = "t2.micro"
  tags = {
    Name = "server01"
  }
  depends_on = [ aws_instance.instance02,aws_instance.instance03 ]
}


/*===========================================================================*/
resource "aws_instance" "instance02" {
  ami = "ami-00bb6a80f01f03502"
  key_name = "Ironman123"                           
  subnet_id = "subnet-0190892523e6aa9b0"
  instance_type = "t3.micro"
  tags = {
    Name = "server02"
  }
}

/*===========================================================================*/
resource "aws_instance" "instance03" {
  ami = "ami-00bb6a80f01f03502"
  key_name = "Ironman123"                           
  subnet_id = "subnet-0190892523e6aa9b0"
  instance_type = "t2.micro"
  tags = {
    Name = "server03"
  }
}

# First server02 will create then server01 because dependency block applied