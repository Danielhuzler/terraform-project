################################################
###### ec2 intance wev tier  ######
################################################


resource "aws_instance" "publicWebTemplate" {      
  ami                                             = "ami-0360c520857e3138f" 
  instance_type                                   = "t2.micro"
  vpc_security_group_ids                          = [aws_security_group.webserver-security-group.id]
  subnet_id                                       = aws_subnet.public-web-sunbet-1.id 
  key_name                                        = "source-key"
  user_data                                     = file("install-apache.sh")
  
    tags = {
    Name = "web-asg"
  }
}



################################################
###### ec2 intance app tier  ######
################################################


resource "aws_instance" "private-App-Template" {
  ami                                             = "ami-0360c520857e3138f"
  instance_type                                   = "t2.micro"
  vpc_security_group_ids                          = [aws_security_group.app-security-group.id]
  subnet_id                                       = aws_subnet.private-app-subnet-1.id 
  key_name                                        = "source-key"
  
    tags = {
    Name = "app-asg"
  }
}


