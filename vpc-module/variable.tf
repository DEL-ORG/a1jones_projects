variable "region" {
  type    = string
  default = "us-east-1"
}

variable "tags" {
  type = map(any)
  default = {
    "id"             = "2127"
    "owner"          = "Jones"
    "team"           = "Soaring to Sixfigures"
    "environment"    = "dev"
    "project"        = "vpc_module"
    "create_by"      = "moi"
    "cloud_provider" = "aws"
  }

}

variable "cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "availability_zone" {
  type    = list(any)
  default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}