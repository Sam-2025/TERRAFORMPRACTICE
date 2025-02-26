provider "aws" {
    alias = "fardeen"
    profile = "Don"
}

resource "aws_s3_bucket" "name" {
    bucket = "gHgdfsghJZDUCG"
  
}
data "aws_region" "nam" {
  provider = aws.fardeen
}
output "name" {
  value = data.aws_region.nam
}