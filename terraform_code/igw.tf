resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.ot-micro.id

  tags = {
    Name = "OT-igw"
    Type = "application"
  }
}