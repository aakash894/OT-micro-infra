resource "aws_security_group" "es" {
  name        = "elastic search"
  description = "elasticsearch db sg"
  vpc_id      = aws_vpc.ot-micro.id

  dynamic "ingress" {
    for_each = [22, 9200]
    iterator = port
    content {
      description = "SG-es"
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = [aws_vpc.ot-micro.cidr_block]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Elasticsearch"
    Type = "Database"
  }
}

resource "aws_security_group" "mysql" {
  name        = "Mysql"
  description = "Mysql db sg"
  vpc_id      = aws_vpc.ot-micro.id

  dynamic "ingress" {
    for_each = [22, 3306]
    iterator = port
    content {
      description = "SG-mysql"
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = [aws_vpc.ot-micro.cidr_block]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Mysql"
    Type = "Database"
  }
}

