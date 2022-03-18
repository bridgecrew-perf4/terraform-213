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
      name = "networking"
    }
  }
}

provider "aws" {
  region = "ap-south-1" // Mumbai region
  /*
   * This file should contain an aws-credentials in the below format
        [default]
        aws_access_key_id=AKIAIOSFODNN7EXAMPLE
        aws_secret_access_key=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY

    Don't worry they are not the original credentials.
    Refer the AWS docs page for more info: https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html
  */

  shared_credentials_file = "../../credentials/credentials"
}