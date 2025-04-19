terraform {
  backend "s3" {
    bucket         = "terraform-namadir-bucket"  # <-- your bucket name 
    key            = "ec2/terraform.tfstate"          # <-- file path in S3
    region         = "eu-north-1" 
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }

}
