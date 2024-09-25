include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../modules/"
}

inputs        = {
  environment     = "prod"
  main_network_block = "10.1.0.0/16"
  private_subnets = ["10.1.1.0/24", "10.1.2.0/24"]
  public_subnets = ["10.1.101.0/24", "10.1.102.0/24"]
}
