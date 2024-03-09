resource "aws_nat_gateway" "a1jones_nat_gateway" {
  count         = length(var.availability_zone)
  allocation_id = element(aws_eip.a1jones_eip.*.id, count.index)
  subnet_id     = element(aws_subnet.a1jones_public_subnet.*.id, count.index)

  tags = merge(var.tags, {
    Name = format("%s-a1jones_nat_gateway-${count.index}", var.tags["id"])
    }
  )

  depends_on = [aws_internet_gateway.a1jones_igw]
}