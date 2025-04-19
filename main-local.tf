provider "aws" {
  region = "eu-north"  # Change to your desired region
}

resource "aws_instance" "example" {
  ami           = "i-00209260303ed2513"   # Ubuntu Server 22.04 LTS (for ap-south-1)
  instance_type = "t3.micro"
  key_name      = "test"       # Replace with your existing key pair name

  tags = {
    Name = "Terraform-EC2"
  }
}
