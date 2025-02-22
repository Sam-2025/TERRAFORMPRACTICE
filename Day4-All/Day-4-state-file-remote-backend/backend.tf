
terraform {
backend "s3" {
    bucket         = "fardeenattar123"  
    region         =  "ap-south-1"
    key            = "terraform.tfstate" 
    dynamodb_table = "lock-dynamo" 
    encrypt        = true
  }
}