##########################################3
############# vpc cidr blocks ########33
#########################################333
variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

##########################################
############# presentation tier cidr blocks 1 ########
#########################################

variable "public-web-sunbet-1-cidr" {
  description = "public_web_subnet_1"
    type        = string
    default     = "10.0.1.0/24"
}

##########################################
############# presentation tier cidr blocks 2 ########
#########################################

variable "public-web-subnet-2-cidr" {
  description = "public_web_subnet_2"
    type        = string
    default     = "10.0.2.0/24"
}


variable "private-app-subnet-1-cidr" {
    description = "private_app_subnet_1"
        type        = string
        default     = "10.0.3.0/24"
  
}


###########################################
############# application tier cidr blocks 2 ########
###########################################

variable "private-app-subnet-2-cidr" {
    description = "private_app_subnet_2"
        type        = string
        default     = "10.0.4.0/24"
}

###########################################
######### db cidr block 1 #############
######################################

variable "private-db-subnet-1-cidr" {
    default = "10.0.5.0/24"
    description = "private_db_subnet_2"
        type        = string
  
}


###########################################
######### db cidr block 2 #############
#######################################

variable "private-db-subnet-2-cidr" {
    default = "10.0.6.0/24"
 description = "private_db_subnet_2"
        type        = string
}

###########################################
#########       DB instance       #########
###########################################

variable "database-instance-class" {
    default = "db.t2.micro"
    description = "the database instance type"
        type        = string
  
}

###########################################
######### app tier security group #########
###########################################

variable "ssh-locate" {
    default = "your_ip_address"
    description = "ip address"
       type = string
}

###########################################
######### multi az deployment #########
###########################################

variable "multi-az-deployment" {
    default = true
    description = "create a standby db instance"
         type = bool
}

