terraform {
  required_version = "1.10.3"
  required_providers {
    aws = {
      version = "5.82.1"
      source  = "hashicorp/aws"
    }
    helm = {
      version = "2.16.1"
      source  = "hashicorp/helm"
    }
  }
}
