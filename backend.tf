terraform {
  backend "s3" {
    bucket         = "eks-plusone-x"
    key            = "eks-plusone-x/dev/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "TerrastateLock"
  }
}

