terraform {
  backend "s3" {
    bucket = "s3-agcs-tf-bucket"
    key    = "intake/tfstate"
    region = "eu-central-1"
  }
}