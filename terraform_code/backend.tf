terraform {
  backend "s3" {
    bucket = "terraformstatemonitor"
    key    = "terraform-state/terraform.tfstate"
    region = "ap-south-1"
  }
}
