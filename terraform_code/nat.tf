resource "aws_eip" "eip" {
  vpc = true
}

resource "aws_nat_gateway" "nat" {
  allocation_id     = aws_eip.eip.id
  subnet_id         = aws_subnet.traefik1.id
  connectivity_type = "public"

  tags = {
    Name = "Ot-nat"
    Type = "application"
  }
}