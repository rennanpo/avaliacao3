variable "node_role_arn" {
  description = "ARN da IAM Role para os nós do EKS"
  type        = string
}

variable "ssh_key_name" {
  description = "Nome da chave SSH usada para os nós do EKS"
  type        = string
}

variable "todo_image" {
  description = "Caminho completo para a imagem Docker no ECR"
  type        = string
}