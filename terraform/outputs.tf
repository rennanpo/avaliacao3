output "eks_cluster_name" {
  value = data.aws_eks_cluster.eks.name
}

output "node_group_name" {
  value = aws_eks_node_group.node_group.node_group_name
}

output "load_balancer_hostname" {
  value = kubernetes_service.todo_service.status[0].load_balancer[0].ingress[0].hostname
}