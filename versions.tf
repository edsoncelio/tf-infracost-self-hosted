terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      version = ">= 4.0"
      source  = "hashicorp/aws"
    }
    http = {
      version = ">= 2.0"
      source  = "hashicorp/http"
    }
    random = {
      version = ">= 3.0"
      source  = "hashicorp/random"
    }
    template = {
      version = ">= 2.0"
      source  = "hashicorp/template"
    }
  }
}
