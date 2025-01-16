terraform {
  required_version = "1.10.3"
  required_providers {
    aws = {
      version = "5.84.0"
      source  = "hashicorp/aws"
    }
    helm = {
      version = "2.17.0"
      source  = "hashicorp/helm"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.35.1"
    }
    local = {
      source  = "hashicorp/local"
      version = "2.5.2"
    }
  }
}
