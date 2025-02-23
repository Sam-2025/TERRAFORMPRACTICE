provider "aws" {
 
}

module "server_instance" {
  source         = "./modules/ec2-child-module"
  machine_size   = "t2.micro"
  ssh_key        = "Ironman123"
  image          = "ami-0d682f26195e9ec0f"
  subnt          = "subnet-0cda5ad3e644c6d65"
  tag            = "Module"
}

module "data_storage" {
  source      = "./modules/s3-child-module"
  bucket_id   = "fardeen123"
  acl_list = "private"
  ownobject = "ObjectWriter"

}

