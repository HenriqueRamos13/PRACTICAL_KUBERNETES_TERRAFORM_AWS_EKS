resource "aws_subnet" "first_private" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.first_private_subnet_cidr
  availability_zone = var.availability_zones[0]

  tags = {
    subnet = "private"
  }
}

resource "aws_subnet" "seccond_private" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.seccond_private_subnet_cidr
  availability_zone = var.availability_zones[1]

  tags = {
    subnet = "private"
  }
}

resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.this.id
  }

  tags = {
    subnet = "private"
  }
}

resource "aws_route_table_association" "first_private" {
  subnet_id      = aws_subnet.first_private.id
  route_table_id = aws_route_table.private_route_table.id
}

resource "aws_route_table_association" "seccond_private" {
  subnet_id      = aws_subnet.seccond_private.id
  route_table_id = aws_route_table.private_route_table.id
}

