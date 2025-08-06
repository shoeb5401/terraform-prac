locals {
  region          = "ap-south-1"
  name            = "eks-terraform-cluster"
  vpc_cidr        = "10.0.0.0/16"
  azs             = ["ap-south-1a", "ap-south-1b"]
  private_subnets = ["10.0.10.0/24", "10.0.11.0/24"]
  public_subnets  = ["10.0.20.0/24", "10.0.21.0/24"]
  intra_subnets   = ["10.0.30.0/24", "10.0.31.0/24"]

  env = "dev"


}