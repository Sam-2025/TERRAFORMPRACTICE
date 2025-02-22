module "free_tier_rds" {
  source              = "github.com/Fardeen313/terraform-aws-rds-module-code"
  identifier          = "module-db"

  engine              = "mysql"
  engine_version      = "8.0.35"  # Updated to the latest MySQL version
  instance_class      = "db.t3.micro"  # Free Tier eligible instance
  allocated_storage   = 20  # Free Tier minimum storage

  db_name             = "demodb"
  username            = "admin"
  password            = "mypasswd"  # Use AWS Secrets Manager for security
  port                = "3306"

  iam_database_authentication_enabled = true
  publicly_accessible                 = true

  vpc_security_group_ids = ["sg-sd6s5563d6e6s5d6w66e"]
  create_db_subnet_group = true
  subnet_ids             = ["subnet-123456789101112", "subnet-987654321987654"]


  backup_retention_period = 7
  backup_window           = "03:00-06:00"
  maintenance_window      = "Mon:01:00-Mon:03:00"

  # Disable monitoring for Free Tier
  monitoring_interval     = 0
  create_monitoring_role  = false

  tags = {
    Owner       = "user"
    Environment = "dev"
  }

  # Use default parameter and option groups for MySQL 8.0
  family                 = "mysql8.0"
  major_engine_version   = "8.0"
  parameter_group_name   = "mysql8-param-group"  # Explicit parameter group name
  option_group_name      = "mysql8-option-group"  # Explicit option group name

  deletion_protection    = false
  skip_final_snapshot    = true

}



