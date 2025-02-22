resource "aws_instance" "life" {
    ami = "ami-0ddf99227948f73"
    key_name = "keypair"
    instance_type = "t2.micro"
    subnet_id = "subnet-0c35667aeff64553"               /*Here subnet is changed */
    tags = {
      Name = " lifecycle_rules"
    }


/*lifecycle {
    create_before_destroy = true 
}



lifecycle {
  prevent_destroy = true
}

*/


lifecycle {
  ignore_changes = [tags]
} 

/*
lifecycle {
  ignore_changes = [
    all
  ]
}
*/
}












