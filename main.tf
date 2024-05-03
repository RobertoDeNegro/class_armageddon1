terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.27.0"
    }
  }
}

provider "google" {
  # Configuration options
project = "learned-now-417417"
region = "us-central1"
zone = "us-central1-a"
credentials = ""
}