######################################
############ Database Security Group ##########
######################################


resource "aws_security_group" "database-security-group" {
  name        = "database server security group"
  description = "enable MYSQL access on port 3306"
  vpc_id      = aws_vpc.vpc_01.id

ingress {
    description = " MYSQL access" 
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    cidr_blocks = ["${aws_security_group.webserver-security-group.id}"]
    }
    egress {
        from_port = 0
        to_port = 0 
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]

    }




  tags = {
    Name = "database security group"

  }
}
