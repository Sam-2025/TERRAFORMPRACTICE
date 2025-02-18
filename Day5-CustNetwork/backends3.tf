terraform {
  backend "s3" {
    bucket = "fardeenattar123"
    key    = "Day5-output/terraform.tf"
    region = "ap-south-1"

  }
}