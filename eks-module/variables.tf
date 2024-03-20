variable "region" {
  type    = string
  default = "us-east-1"
}
variable "aws_iam_role_name" {
  type    = string
  default = "eks-iam-role"
}

variable "project_name" {
  type    = string
  default = "eks-cluster"
}
variable "eks-cluster" {
  type    = string
  default = "a1jones-eks-cluster"
}
variable "eks-cluster-version" {
  type    = string
  default = "1.28"
}
variable "endpoint_private_access" {
  type    = bool
  default = false
}
variable "endpoint_public_access" {
  type    = bool
  default = true
}
variable "a1jones_subnet_id" {
  type    = list(string)
  default = [""]
}
variable "tags" {
  type = map(string)
  default = {
    "id"          = "2127"
    "owner"       = "a1jones"
    "teams"       = "a1jones-project"
    "environment" = "dev"
    "project"     = "eks-cluster"
    "create_by"   = "a1jones-Terraform"
  }

}
