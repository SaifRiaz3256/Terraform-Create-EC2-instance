# 🚀 Terraform EC2 Instance on AWS

This is my first Terraform project! It automates the provisioning of a basic EC2 instance on AWS using infrastructure-as-code principles. The Terraform configuration includes:

- Remote state storage in an S3 bucket with DynamoDB locking  
- EC2 instance creation with variable configuration  
- Output of useful instance details (like public IP)

---

## 📁 Project Structure
```
terraform-ec2/ ├── main.tf # EC2 instance definition
├── variables.tf # Input variables
├── outputs.tf # Output values (e.g., instance ID, IP)
├── backend.tf # Remote state configuration
├── terraform.tfvars # Variable values (not pushed to Git)
├── .gitignore # Ignored files and folders
```

---

## ⚙️ Prerequisites

Before using this project, make sure you have:

- Terraform installed  
- An AWS account with a key pair created  
- AWS CLI configured (`aws configure`)  
- Your `.pem` key saved locally (but **not** pushed to Git)

---

## ☁️ Remote State Setup

This project uses:

- **S3 bucket** to store Terraform state  
- **DynamoDB** table for state locking

Make sure the bucket and table exist before running Terraform:

```bash
# Create S3 Bucket (replace bucket name with your own, must be unique)
aws s3api create-bucket \
  --bucket my-terraform-state-bucket-001 \
  --region eu-north-1 \
  --create-bucket-configuration LocationConstraint=eu-north-1

# Enable versioning
aws s3api put-bucket-versioning \
  --bucket my-terraform-state-bucket-001 \
  --versioning-configuration Status=Enabled

# Create DynamoDB table
aws dynamodb create-table \
  --table-name terraform-locks \
  --attribute-definitions AttributeName=LockID,AttributeType=S \
  --key-schema AttributeName=LockID,KeyType=HASH \
  --billing-mode PAY_PER_REQUEST
```
---

## 🧪 Usage
1. Clone this repository
```bash

git clone https://github.com/SaifRiaz3256/Terraform-Create-EC2-instance.git
cd Terraform-Create-EC2-instance
```
2. Add your variable values
Create a terraform.tfvars file:

```hcl

key_name = "your-key-name"
You can find your key name in the AWS EC2 Console under "Key Pairs".
```
3. Initialize Terraform
```bash

terraform init
```
4. Plan the deployment
```bash

terraform plan -var-file="terraform.tfvars"
```
5. Apply to launch the EC2 instance
```bash

terraform apply -var-file="terraform.tfvars"
```
---
## 📤 Outputs
After apply, Terraform will show:
Instance ID,Public IP (you can use it to SSH into the instance)

---
## 🧹 Cleanup
To delete all resources:

```bash

terraform destroy -var-file="terraform.tfvars"
```  
---
