output "ec2_instance_id" {
  value = module.server_instance.server_identifier
}

output "s3_bucket_name" {
  value = module.data_storage.storage_identifier
}
