output "instance_public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.my_instance.public_ip
}

output "instance_private_ip" { 
  description = "Private IP of the EC2 instance"
  value       = aws_instance.my_instance.private_ip
}

output "instance_tags" {
  description = "Tags assigned to the EC2 instance"
  value       = aws_instance.my_instance.tags
}

output "instance_type" {
  description = "Instance type of the EC2 instance"
  value       = aws_instance.my_instance.instance_type
}

output "instance_subnet_id" {
  description = "Subnet ID of the EC2 instance"
  value       = aws_instance.my_instance.subnet_id
}

output "instance_vpc_id" {
  description = "VPC ID where the instance is running"
  value       = aws_instance.my_instance.vpc_security_group_ids[0]  # First VPC ID from the list
}

output "instance_availability_zone" {
  description = "Availability Zone of the EC2 instance"
  value       = aws_instance.my_instance.availability_zone
}
