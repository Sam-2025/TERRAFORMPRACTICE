locals {
  bucket-name = "${var.layer}-${var.env}-bucket-hydnard"
  env         = "dev"
  type        = "web"
}

resource "aws_s3_bucket" "demo" {
  # bucket = "web-test-bucket-hydnaresh"
  # bucket = "${var.layer}-${var.env}-bucket-hyd"
  bucket = local.bucket-name
  tags = {
    Name        = "${var.layer}-${var.env}-bucket-hyd"
    Name        = local.type
    Environment = local.env
  }



}