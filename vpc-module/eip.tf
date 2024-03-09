resource "aws_eip" "a1jones_eip" {
  count = length(var.availability_zone)
  vpc   = true
  tags = merge(var.tags, {
    Name = format("%s-a1jones_eip-${count.index}", var.tags["id"])
    }
  )
  depends_on = [aws_internet_gateway.a1jones_igw]
}