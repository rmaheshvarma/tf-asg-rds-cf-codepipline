resource "aws_security_group" "mydb1" {
  name = "mydb1"

  description = "RDS postgres servers (terraform-managed)"
  vpc_id = aws_vpc.default.id

  # Only postgres in
  ingress {
    from_port = 5432
    to_port = 5432
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound traffic.
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}



resource "aws_subnet" "rds" {
  count = length(var.rds_private_subnet_cidr_blocks)

  vpc_id            = aws_vpc.default.id
  cidr_block        = var.rds_private_subnet_cidr_blocks[count.index]
  availability_zone = var.availability_zones[count.index]
}


resource "aws_db_subnet_group" "db-subnet" {
name = "post-db-subnet-group"
subnet_ids = aws_subnet.rds.*.id

}





resource "aws_db_instance" "mydb1" {
  allocated_storage        = "${var.allocated_storage}" 
  backup_retention_period  = "${var.backup_retention_period}"
  db_subnet_group_name     = "${aws_db_subnet_group.db-subnet.name}"
  engine                   = "${var.engine}"
  engine_version           = "${var.engine_version}"
  identifier               = "${var.identifier}"
  instance_class           = "${var.instance_class}"
  multi_az                 = "${var.multi_az}"
  name                     = "${var.name}"
  password                 = "${var.password}"
  port                     = "${var.port}"
  publicly_accessible      = "${var.publicly_accessible}"
  storage_encrypted        = "${var.storage_encrypted}"
  storage_type             = "${var.storage_type}"
  username                 = "${var.username}"
  vpc_security_group_ids   = ["${aws_security_group.mydb1.id}"]
}


