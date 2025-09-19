########################################
############# route table  #############
########################################

resource "aws_route_table" "public-route-table" {
  vpc_id = aws_vpc.vpc_01.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }


  tags = {
    Name = "public-route-table"
  }
}

########################################
######## route table associate #########
########################################

resource "aws_route_table_association" "public-subnet-1-route-association" {
  subnet_id      = aws_subnet.public-web-sunbet-1.id
  route_table_id = aws_route_table.public-route-table.id
}


########################################
########### private subnet 1 ###########
########################################

resource "aws_subnet" "private-app-subnet-1" {
  vpc_id     = aws_vpc.vpc_01.id
  cidr_block = var.private-app-subnet-1-cidr
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = false

  tags = {
    Name = "private-subnet-1 | app tier"
  }
}

########################################
########### private subnet 2 ###########
########################################

resource "aws_subnet" "private-app-subnet-2" {
  vpc_id     = aws_vpc.vpc_01.id
  cidr_block = var.private-app-subnet-2-cidr
  availability_zone_id = "us-east-1b"
  map_public_ip_on_launch = false 


  tags = {
    Name = "private-subnet-2 | app tier"
  }
}

########################################
###### private subnet-db 1 #######
########################################

resource "aws_subnet" "private-db-subnet-1" {
  vpc_id     = aws_vpc.vpc_01.id
  cidr_block = var.private-db-subnet-1-cidr
  availability_zone = "us-east-1a"
  map_public_ip_on_launch =false


  tags = {
    Name = "private-subnet-1 | db tier"
  }
}

########################################
###### private subnet-db 2 #######
########################################

resource "aws_subnet" "private-db-subnet-2" {
  vpc_id     = aws_vpc.vpc_01.id
  cidr_block = var.private-db-subnet-2-cidr
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = false


  tags = {
    Name = "private-subnet-2 | db tier"
  }
}


