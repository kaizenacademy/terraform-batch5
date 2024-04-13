terraform {
  backend "s3" {
    bucket = "kaizen-adilet"
    key    = "ohio/terraform.tfstate"
    region = "us-east-2"
  }
}
