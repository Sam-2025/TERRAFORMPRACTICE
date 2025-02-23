output "storage_identifier" {
  value = aws_s3_bucket.app_storage.bucket
}
output "storage_name" {
  value = aws_s3_bucket.app_storage.id
}