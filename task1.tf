terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.27.0"
    }
  }
}

provider "google" {
  # Configuration options
  project     = "learned-now-417417"
  region      = "us-central1"
  zone        = "us-central1-a"
  credentials = "learned-now-417417-be9886a876eb.json"
}

resource "google_storage_bucket" "bucket" {
  name          = "bucket_asteroid_collision"
  location      = "US-CENTRAL1"
  storage_class = "STANDARD"
  force_destroy = true
  website {
    main_page_suffix = "index.html"
    not_found_page   = "error.html"
  }
  uniform_bucket_level_access = true
}

resource "google_storage_bucket_object" "website" {
  name   = "webpage"
  source = "index.html"
  bucket = google_storage_bucket.bucket.name
}

output "website_url" {
  value = google_storage_bucket.bucket.self_link
}
