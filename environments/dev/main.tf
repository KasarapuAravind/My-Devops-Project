module "vpc" {
  source = "../../modules/vpc"

  env                 = "dev"
  vpc_cidr            = "10.0.0.0/16"
  public_subnets      = ["10.0.1.0/24", "10.0.2.0/24"]
  availability_zones  = ["us-west-2a", "us-west-2b"]
}

module "iam" {
  source = "../../modules/iam"

  env = "dev"
}

module "eks" {
  source = "../../modules/eks"

  env           = "dev"
  eks_role_arn  = module.iam.eks_cluster_role_arn
  node_role_arn = module.iam.eks_node_role_arn
  subnet_ids    = module.vpc.public_subnet_ids
  desired_size  = 2
  max_size      = 3
  min_size      = 1
}

module "addons" {
  source = "../../modules/addons"

  cluster_name = module.eks.cluster_name
}