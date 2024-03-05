# Include resources
resource "aws_db_subnet_group" "a1jones_subnet_group" {
  name       = "a1jones_subnet_group"
  subnet_ids = var.subnet
}

resource "aws_rds_cluster_parameter_group" "aws_rds_cluster_group" {
  name        = "a1jones-rds-cluster-group"
  family      = "aurora-postgresql11"
  description = "RDS cluster parameter group"
}

resource "aws_rds_cluster" "a1jones_postgresql" {
  cluster_identifier              = "a1jones-aurora-cluster"
  engine                          = "aurora-postgresql"
  engine_version                  = "11.9"
  database_name                   = "a1jones_db"
  master_username                 = "asheri_buri"
  master_password                 = "Sixfigures2024$"
  backup_retention_period         = 5
  preferred_backup_window         = "10:00-12:00"
  db_subnet_group_name            = aws_db_subnet_group.a1jones_subnet_group.name
  db_cluster_parameter_group_name = aws_rds_cluster_parameter_group.aws_rds_cluster_group.name
  vpc_security_group_ids          = ["sg-0d1d31a742b58d0eb"]
  skip_final_snapshot             = true
  storage_encrypted               = true
  deletion_protection             = false

  lifecycle {
    ignore_changes = [
      engine_version
    ]
  }
}

resource "aws_rds_cluster_instance" "a1jones_cluster_instances" {
  count                = 2
  identifier           = "a1jones-aurora-instance-${count.index}"
  cluster_identifier   = aws_rds_cluster.a1jones_postgresql.id
  instance_class       = "db.r5.large"
  engine               = "aurora-postgresql"
  engine_version       = "11.9"
  db_subnet_group_name = aws_db_subnet_group.a1jones_subnet_group.name

  tags = merge(var.common_tags, {
    Name = format("%s-a1jones-cluster-instance-${count.index}", var.common_tags["project"])
  })

  lifecycle {
    ignore_changes = [
      engine_version
    ]
  }
}
