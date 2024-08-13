# Download AWS provider
terraform {
  required_providers {
    aws = {
      version = "~> 5.0"
      source  = "hashicorp/aws"
    }
  }
}

# Set AWS region
provider "aws" {
  region = "eu-south-1"
}
