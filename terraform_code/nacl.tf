resource "aws_network_acl" "ot" {
  vpc_id = aws_vpc.ot-micro.id

  ingress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = aws_subnet.application1.cidr_block
    from_port  = 0
    to_port    = 0
  }

  ingress {
    protocol   = "-1"
    rule_no    = 200
    action     = "allow"
    cidr_block = aws_subnet.application2.cidr_block
    from_port  = 0
    to_port    = 0
  }

  egress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = aws_subnet.application1.cidr_block
    from_port  = 0
    to_port    = 0
  }

  egress {
    protocol   = "-1"
    rule_no    = 200
    action     = "allow"
    cidr_block = aws_subnet.application2.cidr_block
    from_port  = 0
    to_port    = 0
  }

  egress {
    protocol   = "tcp"
    rule_no    = 300
    action     = "allow"
    cidr_block = aws_subnet.application1.cidr_block
    from_port  = 1024
    to_port    = 65535
  }

  egress {
    protocol   = "tcp"
    rule_no    = 400
    action     = "allow"
    cidr_block = aws_subnet.application2.cidr_block
    from_port  = 1024
    to_port    = 65535
  }

  tags = {
    Name = "Ot-nacl"
    Type = "application"
  }
}

resource "aws_network_acl_association" "a" {
  network_acl_id = aws_network_acl.ot.id
  subnet_id      = aws_subnet.database1.id
}

resource "aws_network_acl_association" "b" {
  network_acl_id = aws_network_acl.ot.id
  subnet_id      = aws_subnet.database2.id
}