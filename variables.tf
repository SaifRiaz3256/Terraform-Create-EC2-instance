variable "region" {
  description = "AWS region to launch resources in"
  type        = string
  default     = "eu-north-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "ami_id" {
  description = "AMI ID for EC2 instance"
  type        = string
  default     = "ami-0c1ac8a41498c1a9c"
}

variable "key_name" {
  description = "Key pair name for SSH access"
  type        = string
}

