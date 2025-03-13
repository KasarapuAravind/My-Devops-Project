output "vpc_id" {
    description = "ID of the VPC"
    value = aws_vpc.eks_vpc.id
}

output "public_subnets" {
    description = "list of public subnets"
    value = aws_subnet.eks_public_subnets[*].id
}

output "internet_gateway" {
    description = "id of igw"
    value = aws_internet_gateway.eks_vpc_igw.id
}
