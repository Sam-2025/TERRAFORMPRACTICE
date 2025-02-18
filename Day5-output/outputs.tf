output "ip" {
  value = aws_instance.test.public_ip
}
output "privateip" {
  value = aws_instance.test.private_ip
}
output "az" {
  value = aws_instance.test.availability_zone
}
output "key" {
  value = aws_instance.test.key_name
}
output "subnt" {
  value = aws_instance.test.subnet_id
  sensitive = true
}