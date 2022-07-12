####################################################################################
####                                                                            ####
####                           Mumbai  (ap-south-1)                            ####
####                                                                            ####
####################################################################################

provider "aws" {
  region                  = "ap-south-1"
  shared_credentials_file = var.shared_credentials_file
  profile                 = var.profile
}

terraform {
  backend "s3" {
    bucket                  = "stage-tf-state"
    key                     = "zudo/zudo.tfstate"
    region                  = "ap-south-1"
    profile                 = var.profile
    shared_credentials_file = var.shared_credentials_file
  }
}
