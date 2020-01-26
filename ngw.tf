//Criação dos elastic ips que serão atachados aos nat gateways
resource "aws_eip" "eip-privatesubnet" {
  count = var.az_count
  vpc   = true

  tags = {
    Environment = "webapp"
  }
}
//Criação dos Nat Gateways que serão utilizados para que as subnets privadas se comuniquem com a internet
resource "aws_nat_gateway" "gw" {
  count         = var.az_count
  subnet_id     = element(aws_subnet.public.*.id, count.index)
  allocation_id = element(aws_eip.eip-privatesubnet.*.id, count.index)

  tags = {
    Environment = "webapp"
  }
}
