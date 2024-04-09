terraform {
  cloud {
    organization = "khangdev"

    workspaces {
      name = "docker-swerm"
    }
  }


  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = var.availability_zone
}