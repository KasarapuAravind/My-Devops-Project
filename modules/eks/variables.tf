variable "env" {
    description = "environment name"
    type = string  
}

variable "eks_role_arn" {
    description = "arn of the iam role for the eks cluster"
    type = string  
}

variable "node_role_arn" {
    description = "arn of the iam role for the node group"
    type = string  
}

variable "subnet_ids" {
    description = "list of subnet ids for the eks cluster"
    type = list(string)  
}

variable "desired_size" {
    description = "desired number of nodes in the eks node group"
    type = number  
}

variable "max_size" {
    description = "max number of nodes in the eks node group"
    type = number  
}

variable "min_size" {
    description = "min number of nodes in the eks node group"
    type = number  
}