output "cluster_name" {
    description = "Name of the EKS clsuter"
    value = aws_eks_cluster.eks_cluster.name
}

output "node_group_name" {
    description = "name of the eks node group"
    value = aws_eks_node_group.node_group.node_group_name
}

output "cluster_endpoint" {
    description = "endpoint of the eks cluster"
    value = aws_eks_cluster.eks_cluster.endpoint
}

output "kubeconfig_cert_authority_data" {
    description = "base64 encoded cert data to communicate with the eks cluster"
    value = aws_eks_cluster.eks_cluster.certificate_authority[0].data
}