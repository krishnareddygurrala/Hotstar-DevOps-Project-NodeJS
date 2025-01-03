terraform {
  backend "s3" {
    bucket = "mys3bucket-achi-123" # Replace with your actual S3 bucket name
    key    = "EKS/terraform.tfstate"
    region = "us-esat-1"
  }
}
