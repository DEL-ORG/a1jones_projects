resource "aws_internet_gateway" "a1jones_igw" {
  vpc_id = aws_vpc.a1jones_vpc.id

  tags = merge(var.tags, {
    Name = format("%s-a1jones_igw", var.tags["id"])
    }
  )
}