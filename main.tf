terraform {
  # backend "remote" {
  #   organization = "charlieShelbourne"
  #   workspaces {
  #     name = "learn-terraform-aws"
  #   }
  # }

  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~>3.27"
    }
  }

  required_version = ">=0.14.9"

  backend "s3" {
    bucket = "test-terraform-state-2022"
    key    = "mint-strudios-state"
    region = "us-east-1"
  }

}

provider "aws" {
  version = "~>3.0"
  profile = "default"
  region  = "us-east-1"
}

resource "aws_s3_bucket" "b" {
  bucket = "bare-random-bucket-i-decide"
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}