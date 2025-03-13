resource "aws_vpc" "eks_vpc" {
    cidr_block =  var.vpc_cidr

    tags = {
      "Name" = "${var.env}-vpc"
    }
}

resource "aws_subnet" "eks_public_subnets" {
    count = length(var.public_subnets)
    vpc_id = aws_vpc.eks_vpc
    availability_zone = var.public_subnets[count.index]

    tags = {
      "Name" = "${var.env}-public-subnet-${count.index}"
    } 
}

resource "aws_internet_gateway" "eks_vpc_igw" {
    vpc_id = aws_vpc.eks_vpc
    tags = {
      "Name" = "${var.env}-igw"
    }
}

resource "aws_route_table" "eks_vpc_rtb" {
    vpc_id = aws_vpc.eks_vpc.id

    route = {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.eks_vpc_igw.id
    }

    tags = {
      "Name" = "${var.env}-rtb"
    }
}

resource "aws_route_table_association" "eks_rtb_association" {
    count = length(var.public_subnets)

    subnet_id = aws_subnet.eks_public_subnets[count.index].id
    route_table_id = aws_route_table.eks_vpc_rtb.id  
}

