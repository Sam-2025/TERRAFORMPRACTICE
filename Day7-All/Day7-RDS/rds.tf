
resource "aws_db_subnet_group" "local" {
   name = var.subgrp
   subnet_ids = [var.subnet-1a,var.subnet-1b]
   tags = {
    Name = var.subgrp-tag
   }
}
resource "aws_db_instance" "local" {
  db_name                = var.database-name
  engine                = var.engine
  engine_version        = var.engine-version
  identifier            = var.identifier
  allocated_storage     = 10
  instance_class        = var.instance-type
  username              = var.uname  
  password              = var.passwd  # Avoid hardcoding passwords
  db_subnet_group_name  = aws_db_subnet_group.local.id
  skip_final_snapshot   = var.skipsnp
  vpc_security_group_ids = [var.sgdb]
  deletion_protection    = var.delprotn
  
}
