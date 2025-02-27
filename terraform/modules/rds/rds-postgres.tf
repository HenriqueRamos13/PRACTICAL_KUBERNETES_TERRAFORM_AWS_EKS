resource "aws_db_subnet_group" "postgres" {
  name       = "${var.identifier}-subnet-group-${var.env}"
  subnet_ids = var.subnet_ids

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_db_instance" "postgres_instance" {
  allocated_storage      = var.allocated_storage
  engine                 = "postgres"
  engine_version         = var.engine_version
  instance_class         = var.instance_class
  identifier             = var.identifier
  username               = var.username
  password               = var.password
  storage_encrypted      = var.storage_encrypted
  publicly_accessible    = var.publicly_accessible
  skip_final_snapshot    = var.skip_final_snapshot
  db_subnet_group_name   = aws_db_subnet_group.postgres.name
  vpc_security_group_ids = var.vpc_security_group_ids
  multi_az               = var.multi_az
  availability_zone      = var.availability_zone

  backup_retention_period = var.backup_retention_period
  backup_window           = var.backup_window
  maintenance_window      = var.maintenance_window

  copy_tags_to_snapshot = var.copy_tags_to_snapshot

  tags = var.tags
}
