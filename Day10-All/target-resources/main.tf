resource "aws_instance" "sample" {
  ami = "ami-0d682f26195e9ec0f"
  key_name = "Ironman123"
  subnet_id = "subnet-0cda5ad3e644c6d65"
  instance_type = "t2.micro"
  tags = {
    Name = "server01"
  }
}
resource "aws_instance" "test" {
  ami = "ami-0d682f26195e9ec0f"
  key_name = "Ironman123"
  subnet_id = "subnet-0cda5ad3e644c6d65"
  instance_type = "t2.micro"
  tags = {
    Name = "server-02"
  }
}
resource "aws_s3_bucket" "sample" {
  bucket = "fardeen123"
}