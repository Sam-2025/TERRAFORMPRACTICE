provider "aws" {
 
}

module "server_instance" {
  source         = "./modules/ec2-child-module"
  machine_size   = "t2.micro"
  ssh_key        = "key"
  image          = "ami-0d682abcde933ec0f"
  subnt          = "subnet-0646946wd65"
  tag            = "Module"
}

module "data_storage" {
  source      = "./modules/s3-child-module"
  bucket_id   = "mybuck"
  acl_list = "private"
  ownobject = "ObjectWriter"

}

