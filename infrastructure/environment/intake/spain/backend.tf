terraform {
  backend "s3" {
    bucket = "s3-spain-tf-bucket"
    key    = "intake/tfstate"
    region = "eu-west-3"
  }
}