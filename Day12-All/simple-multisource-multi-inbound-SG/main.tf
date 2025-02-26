resource "aws_security_group" "multisource-multiinbound" {
  name = "custom_sg_02"
  description = "this sg created for multiple-sources & multiple protocols without for loop for practice"
  ingress =[
    {
        description = "SSH"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["203.0.113.0/24"]
        ipv6_cidr_blocks = []
        prefix_list_ids = []
        security_groups = [  ]
        self = false

    },
    {
        description = "HTTP from All traffic"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = []
        prefix_list_ids = []
        security_groups = [  ]
        self = false

    },
    {
        description = "HTTPS All"
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = []
        prefix_list_ids = []
        security_groups = [  ]
        self = false

    },
    {
        description = "MySQL"
        from_port = 3306
        to_port = 3306
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/8"]      # example : from backend server
        ipv6_cidr_blocks = []
        prefix_list_ids = []
        security_groups = [  ]
        self = false

    },
  ]
  egress = [ 
    {
        description = "all outbond traffic"
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = [ "0.0.0.0/0" ]
        ipv6_cidr_blocks = []
        prefix_list_ids = []
        security_groups = [  ]
        self = false
        
    }
   ]
   tags = {
    Name = "SeconD-SG"
   }
}