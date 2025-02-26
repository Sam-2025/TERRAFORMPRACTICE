#aws ec2 describe-subnets --query 'Subnets[*].{SubnetId:SubnetId,VpcId:VpcId,CidrBlock:CidrBlock,AvailabilityZone:AvailabilityZone}' --output table

resource "aws_security_group" "sample-sg" {
  name        = "sample-sg"
  description = "this sg for creating multiple egress by terraform"
  vpc_id      = "vpc-0b481dd1f52b87295"
  ingress = [
    for port in var.inbound : {
      description      = "inbopund rules"
      from_port        = port
      to_port          = port
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      self             = false
      security_groups  = []
    }
  ]
  egress = [{
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    self             = false
    security_groups  = []
    description      = "all traffic"

    }
  ]

  tags = {
    Name = "custom-sg"
  }

}