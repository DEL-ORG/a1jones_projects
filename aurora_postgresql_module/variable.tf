variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "subnet" {
  type = list(string)
  default = ["subnet-0703708bbaf348cee",
  "subnet-043ed447f1db7d4e9"]

}

variable "common_tags" {
  type = map(any)
  default = {
    id             = "2127"
    owner          = "a1jones"
    teams          = "Soaring-To-Sixfigures-Group"
    environment    = "dev"
    project        = "aurora-postgres"
    create_by      = "a1jones-Terraform"
    cloud_provider = "aws"
  }
}
