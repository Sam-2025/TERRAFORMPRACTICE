module "new" {
  source = "../day8-source"
     AMI = "ami-00bb6a80f01f03502"
     INSTANCE_TYPE = "t2.micro"
     SUBNET = "subnet-04b493c59ce7a5f24"
}