variable "aws_region" {
  type        = string
  description = "desired aws region"
  default     = "us-east-1"
}

variable "random_s3" {
  type = map(bool)
  default = {
    "special" = false
    "upper"   = false
    "numeric" = true
  }
}

variable "tags" {
  type = map(any)
  default = {
    "id"             = "1300"
    "owner"          = "Jones"
    "teams"          = "Soaring to Sixfigures"
    "environment"    = "dev"
    "project"        = "del"
    "created_by"     = "Terraform"
    "cloud_provicer" = "aws"
  }
}