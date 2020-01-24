resource "aws_vpc" "web" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = true

  tags = {
    Name = "webapp"
  }
}
