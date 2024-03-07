resource "aws_vpc" "a1jones_vpc" {
  cidr_block = var.cidr
  tags = merge(var.tags, {
    Name = "a1jones_vpc"
    }

  )
}