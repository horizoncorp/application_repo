terraform {
  backend "s3" {
    bucket = "s3-spain-tf-bucket"
    key    = "dev/tfstate"
    region = "eu-west-3"
  }
}