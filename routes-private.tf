// Criação de rotas para internet que serão utilizadas pelos nat gateways das subnets privadas
resource "aws_route_table" "rt-private" {
  count  = var.az_count
  vpc_id = aws_vpc.corp.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = element(aws_nat_gateway.gw.*.id, count.index)
  }

  tags = {
    Environment = "webapp"
  }
}
// associação das rotas privadas às subnets privadas
resource "aws_route_table_association" "private" {
  count          = var.az_count
  subnet_id      = element(aws_subnet.private.*.id, count.index)
  route_table_id = element(aws_route_table.rt-private.*.id, count.index)
}
