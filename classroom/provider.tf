terraform {
  required_providers {
    tls = {
      source = "hashicorp/tls"
      version = "3.1.0"
    }

    aws = {
      source = "hashicorp/aws"
      version = "3.56.0"
    }
  }
}
