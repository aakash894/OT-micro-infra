variable "region" {
  type = string
  default = "ap-south-1"
}

## Variable for VPC

variable "cidr_vpc" {
  type = string
  default = "192.168.0.0/16"
}

variable "tenancy" {
  type = string
  default = "default"
}

variable "tags_vpc" {
  type = map
  default = {
    Name = "Ot-micro"
    Type = "application"
  }
}

## Variable for subnet

variable "AZ1" {
  type = string
  default = "ap-south-1a"
}

variable "AZ2" {
  type = string
  default = "ap-aouth-1b"
}

variable "cidr_traefik1" {
  type = string
  default = "192.168.64.0/18"
}

variable "cidr_traefik2" {
  type = string
  default = "192.168.128.0/18"
}

variable "cidr_application1" {
  type = string
  default = "192.168.0.0/19"
}

variable "cidr_application2" {
  type = string
  default = "192.168.32.0/19"
}

variable "cidr_database1" {
  type = string
  default = "192.168.192.0/19"
}

variable "cidr_database2" {
  type = string
  default = "192.168.224.0/19"
}