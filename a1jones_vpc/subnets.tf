resource "aws_subnet" "a1jones_private_subnet" {
  count             = length(var.availability_zone)
  vpc_id            = aws_vpc.a1jones_vpc.id
  cidr_block        = cidrsubnet(var.cidr, 8, count.index)
  availability_zone = element(var.availability_zone, count.index)

  tags = merge(var.tags, {
    Name = format("%s-a1jones_private_subnet-${count.index}", var.tags["id"])
    }
  )
}

resource "aws_subnet" "a1jones_public_subnet" {
  count      = length(var.availability_zone)
  vpc_id     = aws_vpc.a1jones_vpc.id
  cidr_block = cidrsubnet(var.cidr, 6, count.index + 1)

  tags = merge(var.tags, {
    Name = format("%s-a1jones_public_subnet-${count.index}", var.tags["id"])
    }
  )
}