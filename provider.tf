provider "google" {
  credentials = file("terraform-key.json")
  project     = "midyear-mason-301002"
  region      = "us-central1"
}
