module "Dev_instance" {
  source = "./Modules/ec2-instance" 

  machiene_name0  = "test"
  machiene_key0 = ""
}