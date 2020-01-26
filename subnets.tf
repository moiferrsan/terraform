# Cria subnets privadas para cada AZ
resource "aws_subnet" "private" {
  count             = var.az_count
  cidr_block        = cidrsubnet(aws_vpc.corp.cidr_block, 8, count.index)
  availability_zone = data.aws_availability_zones.available.names[count.index]
  vpc_id            = aws_vpc.corp.id

  tags = {
    Name = "Private"
  }
}

# Cria subnets publicas para cada AZ
resource "aws_subnet" "public" {
  count = var.az_count
  cidr_block              = cidrsubnet(aws_vpc.corp.cidr_block, 8, var.az_count + count.index)
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  vpc_id                  = aws_vpc.corp.id
  map_public_ip_on_launch = true

  tags = {
    Name = "Public"
  }
}
