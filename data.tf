terraform {
  backend "s3" {
    bucket = "terraform-state-rs-practice"
    key    = "eks-cluster-az.tfstate"
    region = "us-east-1"
  }
}