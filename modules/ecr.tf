resource "aws_ecr_repository" "ecr_repo" {
  name = "${var.environment}-${var.name_prefix}-${var.ecr_name}"
  image_scanning_configuration {
    scan_on_push = true
  }
}
