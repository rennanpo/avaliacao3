resource "aws_ecr_repository" "todo_app" {
  name = "todo-app-dp011"
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }
  force_delete = true
}
