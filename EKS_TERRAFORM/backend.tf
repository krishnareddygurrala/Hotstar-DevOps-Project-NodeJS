terraform {
  backend "s3" {
    bucket = "mys3bucket-achi-5390" # Replace with your actual S3 bucket name
    key    = "EKS/terraform.tfstate"
    region = "us-east-1"
  }
}
