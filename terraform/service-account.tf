resource "google_service_account" "configs_backup_sa" {
  account_id   = "configs-backup-sa"
  display_name = "Created by terraform support/x001/sb2-configs-backup for control in configs_backup bucket"
  project = "${var.project}"
}


resource "google_storage_bucket_iam_member" "configs_backup_sa" {
  bucket  = "${google_storage_bucket.configs_backup.name}"
  role    = "roles/storage.objectAdmin"
  member  = "serviceAccount:${google_service_account.configs_backup_sa.email}"
}