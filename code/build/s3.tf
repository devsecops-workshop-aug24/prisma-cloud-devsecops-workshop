provider "aws" {
  region = "us-west-2"
}

resource "aws_s3_bucket" "dev_s3" {
  bucket_prefix = "dev-"
  acl = "public-read-write"

  tags = {
    Environment          = "Dev"
    yor_name             = "dev_s3"
    yor_trace            = "bae3c3c4-e2ed-4b3b-acd2-56a760898e12"
    git_commit           = "6b8e3d676ad0d40a8d84cfac8f751f726f556339"
    git_file             = "code/build/s3.tf"
    git_last_modified_at = "2024-08-14 16:22:51"
    git_last_modified_by = "tmprender+8dso@gmail.com"
    git_modifiers        = "tmprender+8dso"
    git_org              = "devsecops-workshop-aug24"
    git_repo             = "prisma-cloud-devsecops-workshop"
  }
}

resource "aws_s3_bucket_ownership_controls" "dev_s3" {
  bucket = aws_s3_bucket.dev_s3.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}
