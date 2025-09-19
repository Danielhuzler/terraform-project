########################################
####### sg presentation tier ###############
########################################

resource "aws_security_group" "webserver-security-group" {
  name        = "web server security group"
  description = "enable http/https access on port 80/443 via alb and ssh via ssh sg"
  vpc_id      = aws_vpc.vpc_01.id

  ingress { 
    description = "http access"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["${aws_security_group.alb-securtiy-group.id}"]
  }

  ingress {
    description = "https access"
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["${aws_security_group.alb-securtiy-group.id}"]
  }

  ingress { 
    description = "ssh access"
    from_port = 22 
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["${aws_security_group.ssh-security-group.id}"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }


  tags = {
    Name = "ssh security group"
  }
}

