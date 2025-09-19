########################################
###### asg for presentation tier  ######
########################################


resource "aws_launch_template" "publicWebTemplate" {
  name_prefix =  "auto-scaling-group"
  image_id = "ami-0360c520857e3138f"
  instance_type = "t2.micro"
  user_data = file("install-apache.sh")
  key_name = "source-key"
  network_interfaces {
    subnet_id = aws_subnet.public-web-sunbet-1.id
    security_groups = [aws_security_group.webserver-security-group.id]

  }
}

resource "aws_autoscaling_group" "asg_1" {
    availability_zones = ["us-east-1a"]
    desired_capacity   = 2
    max_size           = 2
    min_size           = 1
    launch_template {
      id      = aws_launch_template.autoscaling_group.id
      version = "$Latest"  
}
}



#################################
########## asg for application tier  ##########
#################################

resource "aws_launch_template" "auto-scaling-group-private" {
    name_prefix ="auto-scaling-group-private"
    image_id = "ami-0360c520857e3138f"
    instance_type ="t2.micro"
    key_name = "source_key"

    network_interfaces {
        subnet_id = aws_subnet.private-app-subnet-1.id
        security_groups = [aws-security_group.ssh-security-group.id]
    }
  
}


resource "aws_autoscaling_group" "asg_2" {
    availability_zones = ["us-east-1a"]
    desired_capacity   = 2
    max_size           = 2
    min_size           = 1
    launch_template {
      id      = aws_launch_template.auto-scaling-group-private.id
      version = "$Latest"  
}
}





