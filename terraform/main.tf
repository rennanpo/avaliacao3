# Referência ao cluster EKS existente
data "aws_eks_cluster" "eks" {
  name = "eks-deep-dive"
}

data "aws_eks_cluster_auth" "eks" {
  name = data.aws_eks_cluster.eks.name
}

# Referência aos recursos de rede existentes
data "aws_vpc" "eks_vpc" {
  filter {
    name   = "tag:Name"
    values = ["eks-vpc"]
  }
}

data "aws_subnets" "eks_subnets" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.eks_vpc.id]
  }
}

data "aws_security_groups" "eks_sgs" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.eks_vpc.id]
  }
}

# Node Group
resource "aws_eks_node_group" "node_group" {
  cluster_name    = data.aws_eks_cluster.eks.name
  node_group_name = "nodeGroupDP011"
  node_role_arn   = var.node_role_arn
  subnet_ids      = data.aws_subnets.eks_subnets.ids

  scaling_config {
    desired_size = 1
    max_size     = 2
    min_size     = 1
  }

  instance_types = ["t3.small"]

  depends_on = [data.aws_eks_cluster.eks]
}
