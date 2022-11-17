resource "aws_vpc" "ot-micro" {
  cidr_block       = var.cidr_vpc
  instance_tenancy = var.tenancy

  tags = var.tags_vpc
}