resource "aws_instance" "life" {
    ami = "ami-0ddfba243cbee3768"
    key_name = "Ironman123"
    instance_type = "t2.micro"
    subnet_id = "subnet-0cda5ad3e644c6d65"                 /*Here subnet is changed */
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












