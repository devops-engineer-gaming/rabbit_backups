resource "google_storage_bucket" "configs_backup" {
  project = var.project
  name          = "configs-backup"
  location      = "EUROPE-WEST4"
  storage_class = "Standard"
  labels = {}
  uniform_bucket_level_access = false
  force_destroy = true
  versioning {
    enabled = true
  }
  lifecycle_rule {
    condition {
      num_newer_versions = 5
    }
    action {
      type = "Delete"
    }
  }
}
