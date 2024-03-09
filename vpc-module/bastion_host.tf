resource "aws_instance" "bastion_host" {
  ami             = "ami-07d9b9ddc6cd8dd30" # Amazon Linux 2 AMI, change as needed
  instance_type   = "t2.micro"              # Change instance type as needed
  key_name        = "a1jones"               # Replace with your SSH key name
  security_groups = [aws_security_group.bastion-sg.id]

  subnet_id = aws_subnet.a1jones_public_subnet[0].id # Replace with the subnet ID where you want to launch the bastion host

  associate_public_ip_address = true # Automatically assign public IP address

  tags = {
    Name = "a1jones-bastion-host"
  }
}

