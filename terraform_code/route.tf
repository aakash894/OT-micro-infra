resource "aws_route_table" "public" {
  vpc_id = aws_vpc.ot-micro.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name     = "Ot-route-1"
    Type     = "application"
    Category = "public"
  }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.ot-micro.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat.id
  }

  tags = {
    Name     = "Ot-route-2"
    Type     = "application"
    Category = "private"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.traefik1.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.traefik2.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "c" {
  subnet_id      = aws_subnet.application1.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "d" {
  subnet_id      = aws_subnet.application2.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "e" {
  subnet_id      = aws_subnet.database1.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "f" {
  subnet_id      = aws_subnet.database2.id
  route_table_id = aws_route_table.private.id
}

