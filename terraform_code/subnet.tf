resource "aws_subnet" "traefik1" {
  vpc_id            = aws_vpc.ot-micro.id
  cidr_block        = var.cidr_traefik1
  availability_zone = var.AZ1

  tags = {
    Name = "Traefik-sub-1"
    Type = "webserver"
  }
}

resource "aws_subnet" "traefik2" {
  vpc_id            = aws_vpc.ot-micro.id
  cidr_block        = var.cidr_traefik2
  availability_zone = var.AZ2

  tags = {
    Name = "Traefik-sub-2"
    Type = "webserver"
  }
}

resource "aws_subnet" "application1" {
  vpc_id            = aws_vpc.ot-micro.id
  cidr_block        = var.cidr_application1
  availability_zone = var.AZ1

  tags = {
    Name = "Application-sub-1"
    Type = "application"
  }
}

resource "aws_subnet" "application2" {
  vpc_id            = aws_vpc.ot-micro.id
  cidr_block        = var.cidr_application2
  availability_zone = var.AZ2

  tags = {
    Name = "Application-sub-2"
    Type = "application"
  }
}

resource "aws_subnet" "database1" {
  vpc_id            = aws_vpc.ot-micro.id
  cidr_block        = var.cidr_database1
  availability_zone = var.AZ1

  tags = {
    Name = "Database-sub-1"
    Type = "database"
  }
}

resource "aws_subnet" "database2" {
  vpc_id            = aws_vpc.ot-micro.id
  cidr_block        = var.cidr_database2
  availability_zone = var.AZ2

  tags = {
    Name = "Database-sub-2"
    Type = "database"
  }
}
