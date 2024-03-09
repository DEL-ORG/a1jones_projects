resource "aws_instance" "example" {
  ami           = "ami-0e731c8a588258d0d" # Replace with your AMI ID
  instance_type = "t2.micro"
  key_name      = "a1jones"                  # Replace with your key pair name
  subnet_id     = "subnet-0703708bbaf348cee" # Replace with your subnet ID

  security_groups = [
    "sg-08e9e9dc7b5a2fed8", # Replace with your security group ID
  ]
}