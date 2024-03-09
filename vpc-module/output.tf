output "vpc_id" {
  value = aws_vpc.a1jones_vpc.id
}

output "public_subnet_id" {
  value = aws_subnet.a1jones_public_subnet[*].id
}

output "private_subnet_id" {
  value = aws_subnet.a1jones_private_subnet[*].id
}

output "aws_security_group" {
  value = aws_security_group.bastion-sg.id
}

output "bastion_host_ip" {
  value = aws_instance.bastion_host.public_ip
}



