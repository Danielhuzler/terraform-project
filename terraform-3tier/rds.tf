#################################################
######## database subnet group #################
##############################################



resource "aws_db_subnet_group" "database-subnet-group" {
  name       = "database subnets"
  subnet_ids = [aws_subnet.private-db-subnet-1.id, aws_subnet.private-db-subnet-2.id]
  description = "subnet group for database instance"

  tags = {
    Name = "my db subnet group"
  }
}



######################################
######### database instance ##########
######################################


resource "aws_db_instance" "database-instance" {

  allocated_storage    = 10
  db_name              = "sqldb"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = var.database-instance-class
  username             = "admin"
  password             = "admin@123"
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true
  availability_zone = aws_db_subnet_group.database-subnet-group.name
    db_subnet_group_name = aws_db_subnet_group.database-subnet-group.name
    multi_az = var.multi-az-deployment
    vpc_security_group_ids = [aws_security_group.database-security-group.id]
}

