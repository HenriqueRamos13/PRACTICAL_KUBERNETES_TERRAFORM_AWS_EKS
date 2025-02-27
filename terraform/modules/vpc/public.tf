resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id
}

# resource "aws_internet_gateway_attachment" "this" {
#   internet_gateway_id = aws_internet_gateway.this.id
#   vpc_id              = aws_vpc.this.id
# }

resource "aws_subnet" "first_public" {
  vpc_id                  = aws_vpc.this.id
  cidr_block              = var.first_public_subnet_cidr
  availability_zone       = var.availability_zones[0]
  map_public_ip_on_launch = true

  tags = {
    subnet = "public"
  }
}

resource "aws_subnet" "seccond_public" {
  vpc_id                  = aws_vpc.this.id
  cidr_block              = var.seccond_public_subnet_cidr
  availability_zone       = var.availability_zones[1]
  map_public_ip_on_launch = true

  tags = {
    subnet = "public"
  }
}

resource "aws_eip" "this" {
  domain = "vpc"
}

resource "aws_nat_gateway" "this" {
  allocation_id = aws_eip.this.id
  subnet_id     = aws_subnet.first_public.id

  tags = {
    subnet = "public"
  }

  depends_on = [aws_internet_gateway.this]
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }

  tags = {
    subnet = "public"
  }
}

resource "aws_route_table_association" "first_public" {
  subnet_id      = aws_subnet.first_public.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "seccond_public" {
  subnet_id      = aws_subnet.seccond_public.id
  route_table_id = aws_route_table.public_route_table.id
}

