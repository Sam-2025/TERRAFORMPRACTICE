terraform {
  backend "s3" {
    bucket = "fardeenattar123"
    key    = "terraform.tf"
    region = "ap-south-1"
  }
}