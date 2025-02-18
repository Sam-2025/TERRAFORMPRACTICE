resource "aws_instance" "test" {
    ami = "ami-0ddfba243cbee3768"
    key_name = "Ironman123"
    subnet_id = "subnet-04b493c59ce7a5f24"
    availability_zone = "ap-south-1a"
    instance_type = "t2.micro"
    associate_public_ip_address = true

  
}