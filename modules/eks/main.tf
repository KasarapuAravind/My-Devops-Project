resource "aws_eks_cluster" "eks_cluster" {
    name = "${avr.env}-eks-cluster"
    role_arn = var.eks_role_arn

    vpc_config {
      subnet_ids = var.subnet_ids
    }

}

resource "aws_eks_node_group" "node_group" {
    cluster_name = aws_eks_cluster.eks_cluster.name
    node_group_name = "${var.env}-node-group"
    node_role_arn = var.node_role_arn
    subnet_ids = var.subnet_ids

    instance_types = ["t2.micro"]

    scaling_config {
      desired_size = var.desired_size
      max_size = var.max_size
      min_size = var.min_size
    }
}


