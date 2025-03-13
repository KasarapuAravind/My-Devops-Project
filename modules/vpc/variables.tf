variable "env" {
    description = "environment name"
    type = string  
}

variable "vpc_cidr" {
    description = "cidr block of eks vpc"
    type = string  
}

variable "public_subnets" {
    description = "list of public subnets" 
    type = list(string) 
}

variable "availability_zones" {
    description = "list of availability zones"
    type = list(string)  
}