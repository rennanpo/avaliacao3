variable "node_role_arn" {
  description = "ARN da IAM Role para os nós do EKS"
  type        = string
}

variable "todo_image" {
  type        = string
  description = "URI da imagem Docker"
}
