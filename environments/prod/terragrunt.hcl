include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../modules/"
}

inputs        = {
  ec2name     = "prod-ec2"
  ec2ami      = "ami-0e04bcbe83a83792e"
  ec2type     = "t2.medium"
  bucket_name = "prod-bucket-0e04bcbe83"
  ec2name     = "prod-ec2"
  vpcname     = "prod-vpc"
  subnetname  = "prod-subnet"
}
