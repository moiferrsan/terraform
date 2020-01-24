resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.web.id

  tags = {
    Name = "webapp"
  }
}
