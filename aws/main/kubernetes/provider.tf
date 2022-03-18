terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.0"
    }
  }

  backend "remote" {
    organization = "nkjcorp"

    workspaces {
      name = "kubernetes"
    }
  }
}

provider "aws" {
  region = var.region  //Mumbai
  shared_credentials_file = "../../credentials/credentials"
  profile = "nishant-infra.gen"
}