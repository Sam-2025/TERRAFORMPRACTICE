/* CLI COMMAND ==>  
1]  aws ec2 describe-subnets --query "Subnets[*].{ID:SubnetId, AZ:AvailabilityZone, Tags:Tags}" --output table
2]  aws ec2 describe-subnets --query "Subnets[*].{ID:SubnetId, Name:Tags[?Key=='Name']|[0].Value}" --output table
3]  aws ec2 describe-security-groups --query "SecurityGroups[*].{ID:GroupId, Name:Tags[?Key=='Name']|[0].Value}" --output table

*/

data "aws_subnet" "tag" {
  filter {
    name = "tag:Name"
    values = ["subnet 3"]
  }
}
data "aws_security_group" "tag" {
  filter {
    name = "tag:Name"
    values = ["default"]
  }
}
resource "aws_instance" "instance01" {
  ami = "ami-0d682f26195e9ec0f"
  key_name = "Ironman123"
  instance_type = "t3.micro"
  subnet_id = data.aws_subnet.tag.id   #Here subnet 2 --changed to subnet3 name 
  security_groups = [data.aws_security_group.tag.id]
  tags = {
    Name = "server01"
  }
}
output "subnet-of-instance01" {
  value = data.aws_subnet.tag.id
}
output "SecurityGroups" {
  value = data.aws_security_group.tag.id
}