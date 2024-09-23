variable "ec2name" {
  description = "Name of the ec2"
  type        = string
}

variable "ec2type" {
  description = "Type of the ec2"
  type        = string
}

variable "ec2ami" {
  description = "AMI of the ec2"
  type        = string
}

variable "aws_region" {
  description = "aws region"
  type        = string
  default = "eu-central-1"
}

variable "aws_profile" {
  description = "aws profile"
  type        = string
  default = "default"
}

variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "vpcname" {
  description = "Name of the vpc"
  type        = string
}

variable "subnetname" {
  description = "Name of the subnet"
  type        = string
}