include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../modules/"
}

inputs        = {
  ec2name     = "dev-ec2"
  ec2ami      = "ami-0e04bcbe83a83792e"
  ec2type     = "t2.micro"
  bucket_name = "dev-bucket-0e04bcbe83a837"
  ec2name     = "dev-ec2"
  vpcname     = "dev-vpc"
  subnetname  = "dev-subnet"
}