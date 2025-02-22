terraform {
  backend "s3" {
    bucket = "fardeenattar123"
    key    = "output/terraform.tf"
    region = "ap-south-1"

  }
}