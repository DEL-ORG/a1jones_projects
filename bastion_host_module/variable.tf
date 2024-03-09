variable "aws_region" {
  description = "The AWS region"
}

variable "bastion_ami" {
  description = "The ID of the AMI for the Bastion Host"
}

variable "bastion_instance_type" {
  description = "The instance type for the Bastion Host"
}

variable "public_subnet_id" {
  description = "The ID of the public subnet where the Bastion Host will be launched"
}

variable "key_pair_name" {
  description = "The name of the key pair used for SSH access"
}

variable "security_group_id" {
  description = "The ID of the security group allowing SSH access"
}
