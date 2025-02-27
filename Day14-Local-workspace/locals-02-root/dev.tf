module "tes_instance" {
  source = "./Modules/ec2-instance"
  
  machiene_type0   = "t3.micro"
  machiene_key0 = ""
  machiene_name0 = "DEV"
  
}