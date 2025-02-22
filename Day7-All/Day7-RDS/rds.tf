resource "aws_db_instance" "default" {
  allocated_storage    = 10
  db_name              = "database"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  username             = "fardeen"
  password             = "8888313545"
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true
}
