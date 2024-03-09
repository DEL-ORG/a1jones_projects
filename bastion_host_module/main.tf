// Define the Bastion Host
resource "aws_instance" "bastion" {
  ami             = var.bastion_ami
  instance_type   = var.bastion_instance_type
  subnet_id       = var.public_subnet_id
  key_name        = var.key_pair_name
  monitoring      = true
  security_groups = [var.security_group_id]

  tags = {
    Name        = "Bastion Host"
    Environment = "dev"
  }
}

// Allow SSH access to the Bastion Host
resource "aws_security_group_rule" "ssh_ingress" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_instance.bastion.security_groups[0]
}
