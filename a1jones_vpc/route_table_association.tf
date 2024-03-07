resource "aws_route_table_association" "a1jones_rt_associate" {
  count          = length(var.availability_zone)
  subnet_id      = element(aws_subnet.a1jones_public_subnet.*.id, count.index)
  route_table_id = aws_route_table.a1jones_rt_public.id
}


resource "aws_route_table_association" "a1jones_private_rt_associate" {
  count          = length(var.availability_zone)
  subnet_id      = element(aws_subnet.a1jones_private_subnet.*.id, count.index)
  route_table_id = element(aws_route_table.a1jones_rt_private.*.id, count.index)
}