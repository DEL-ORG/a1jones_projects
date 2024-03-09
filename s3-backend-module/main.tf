resource "aws_s3_bucket" "a1jones_s3_backend" {
  bucket = format("%s-${random_string.a1jones_random_s3.result}-statefile", var.tags["id"])

  tags = var.tags
}


resource "random_string" "a1jones_random_s3" {
  length  = 5
  special = var.random_s3["special"]
  upper   = var.random_s3["upper"]
  numeric = var.random_s3["numeric"]
}

