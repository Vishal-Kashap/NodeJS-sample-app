resource "aws_db_instance" "db" {
  allocated_storage     = var.allocated_storage
  storage_type          = var.storage_type
  engine                = var.engine
  instance_class        = var.instance_class
  username              = var.db_username
  password              = var.db_password
  skip_final_snapshot   = true
  publicly_accessible   = false
  vpc_security_group_ids = [aws_security_group.first_security_group.id]  # Hardcoded security group

  # Optional: Uncomment and update the engine version if needed
  # engine_version       = "5.7.41"

  # Optional: Uncomment and update the parameter group if needed
  # parameter_group_name = "default.mysql5.7"
}

resource "aws_db_subnet_group" "main" {
  name       = var.db_subnet_group_name
  subnet_ids = [
    aws_subnet.private_a.id,
    aws_subnet.private_b.id
  ]
}
