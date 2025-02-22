module "new" {
  source = "../day8-source"
     AMI = "ami-0ddf9922794873d"
     INSTANCE_TYPE = "t2.micro"
     SUBNET = "subnet-04b49125646d"
}
