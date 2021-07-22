terraform {
  backend "s3" {
    bucket = "terraform-state-jithendar"
    key    = "eks-cluster-az.tfstate"
    region = "us-east-1"
  }
}