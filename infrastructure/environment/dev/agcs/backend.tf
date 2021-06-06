terraform {
  backend "s3" {
    bucket = "s3-agcs-tf-bucket"
    key    = "dev/tfstate"
    region = "eu-central-1"
  }
}