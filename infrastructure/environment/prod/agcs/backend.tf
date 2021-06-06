terraform {
  backend "s3" {
    bucket = "s3-agcs-tf-bucket"
    key    = "prod/tfstate"
    region = "eu-central-1"
  }
}