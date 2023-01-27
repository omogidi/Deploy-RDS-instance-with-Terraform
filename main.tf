terraform {
  required_version = ">= 0.12.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 2.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 2.0"
    }
  }
}

resource "random_password" "db_password" {
    length = 16
    special = true
    override_special = "_%@"
}

resource "aws_db_instance" "default" {
  allocated_storage    = 10
  db_name              = "mydb"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  username             = "altschool"
  password             = random_password.db_password.result
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  apply_immediately = true
  publicly_accessible = true
}

output "db_password" {
  value = random_password.db_password.result
  sensitive = true
}

output "db_endpoint" {
  value = aws_db_instance.default.endpoint
}
  