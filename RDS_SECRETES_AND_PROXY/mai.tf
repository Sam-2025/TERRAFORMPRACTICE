resource "aws_db_instance" "rds" {
  allocated_storage    = 20
  db_subnet_group_name = aws_db_subnet_group.sub-grp.name  #db_subnet_group_name = aws_db_subnet_group.sub-grp.id wrong
  engine               = "mysql"
  engine_version       = "8.0.40"
  instance_class       = "db.t3.micro"
  db_name              = "mydb"
  username             = var.rds_username  
  password             = var.rds_password  
  skip_final_snapshot  = true
  publicly_accessible  = true

  tags = {
    DB_identifier = "book-rds"
  }

  depends_on = [aws_db_subnet_group.sub-grp]
}

data "aws_subnets" "test" {
  filter {
    name   = "tag:Name"
    values = ["test", "subnet 3", "subnet 1"]
  }
}
# cli command to check subnets : aws ec2 describe-subnets --query "Subnets[*].{ID:SubnetId, Name:Tags[?Key=='Name']|[0].Value}" --output table


resource "aws_db_subnet_group" "sub-grp" {
  name       = "main"
  subnet_ids = data.aws_subnets.test.ids

  tags = {
    Name = "My DB subnet group"
  }

  depends_on = [data.aws_subnets.test]
}

resource "aws_secretsmanager_secret" "secretesdb" {
  name        = "rds-secret"
  description = "Secret for RDS credentials"
}

resource "aws_secretsmanager_secret_version" "rds_secret_version" {
  secret_id     = aws_secretsmanager_secret.secretesdb.id
  secret_string = jsonencode({
    username = var.rds_username
    password = var.rds_password
    endpoint = aws_db_instance.rds.endpoint
    db_name  = aws_db_instance.rds.db_name
  })
}
output "subnet_1" {
  value = data.aws_subnets.test.ids[0]  
}
output "subnet_2" {
  value = data.aws_subnets.test.ids[1]  
}
output "subnet_3" {
  value = data.aws_subnets.test.ids[2] 
}
resource "aws_db_proxy" "rds_proxy" {
  name          = "my-rds-proxy"
  engine_family = "MYSQL"  
  role_arn      = "arn:aws:iam::545009838510:role/rds-admin"
  vpc_subnet_ids = data.aws_subnets.test.ids
  require_tls   = true

  auth {
    secret_arn = aws_secretsmanager_secret.secretesdb.arn
    iam_auth   = "DISABLED"
  }
  depends_on = [ aws_secretsmanager_secret.secretesdb ]
}

# Attach the RDS Proxy to the RDS instance
resource "aws_db_proxy_target" "proxy_target" {
  db_proxy_name          = aws_db_proxy.rds_proxy.name
  target_group_name      = "default"
  db_instance_identifier = aws_db_instance.rds.identifier
}
