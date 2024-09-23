# remote_state {
#   backend = "s3"
#   config = {
#     bucket         = "my-terraform-state-bucket"
#     key            = "${path_relative_to_include()}/terraform.tfstate"
#     region         = "eu-central-1"
#     encrypt        = true
#     dynamodb_table = "my-lock-table"
#   }
# }
