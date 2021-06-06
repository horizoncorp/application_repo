module "landingZone" {

  source = "../../../modules/landing_zone_v1"

  name = "default-vpc"
  cidr = "10.0.0.0/16"

  subnet = {
    "0" = {
      az           = "us-east-2a"
      public_cidr  = ["10.0.0.0/24"]
      private_cidr = ["10.0.2.0/24"]
    }
    "1" = {
      az           = "us-east-2b"
      public_cidr  = ["10.0.1.0/24"]
      private_cidr = ["10.0.3.0/24"]
    }
  }
}