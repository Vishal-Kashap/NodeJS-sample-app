resource "aws_ecr_repository" "my_ecr_repo" {
  name = var.ecr_repo_name
}

output "ecr_repository_url" {
  value = aws_ecr_repository.my_ecr_repo.repository_url
}

