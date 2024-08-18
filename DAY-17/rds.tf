resource "aws_db_instance" "my-rds" {
  db_name = "gfgdb"
  engine = "mysql"
  engine_version = "5.7"
  instance_class = "db.t3.micro"
  username = "admin"
  password = "Hitesh123"
  allocated_storage = 10
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot = true
  publicly_accessible = true
}