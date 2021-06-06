terraform {
  backend "s3" {
    bucket = "s3-agcs-tf-bucket"
    key    = "test/tfstate"
    region = "eu-central-1"
  }
}