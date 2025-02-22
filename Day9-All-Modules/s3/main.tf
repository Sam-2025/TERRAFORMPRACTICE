module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = var.Baucket_Name
  acl    = var.acl

  control_object_ownership = true
  object_ownership         =var.object_ownership

  versioning = {
    enabled = true
  }
}