provider "aws" {
  
}
provider "aws" {
    alias = "alias"
    region = "us-east-1"
  
}

resource "aws_s3_bucket" "provider01" {
  bucket = "northverginiabucket"
  provider = aws.alias
}
resource "aws_s3_bucket" "provider02" {
  bucket = "mumbaibucketfardeen123"
}
