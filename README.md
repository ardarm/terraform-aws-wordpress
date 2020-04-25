# terraform-aws-wordpress
Building high-available Wordpress site in AWS using Terraform and Docker

Pre-requisite :
- Internet Connection
- Terraform (https://learn.hashicorp.com/terraform/getting-started/install.html)
- AWS Account (https://aws.amazon.com/premiumsupport/knowledge-center/create-and-activate-aws-account/)
- AWS-CLI (https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html)

Notes : This project will run on `Amazon Web Services` and the wordpress site will be run using Docker container.

Do this step for Backend-S3 creation : 
```
git clone git@github.com:ardarm/terraform-aws-wordpress.git
cd terraform-aws-wordpress/backend-s3
terraform init 
terraform apply
```

After Backend-S3 remote state creation finished, follow below step :
```
cd ..
terraform init
terraform apply
```

Notes : Please wait untill the provisioning finished. Refer to the `wordpress_dnsname` for the Wordpress link URL.

**Components Created**
----------
- S3 Bucket (for storing remote state)
- KMS Key (for S3 bucket encryption)
- VPC
- Security Groups
- Subnets (Private & Public)
- Route Tables
- Internet Gateway
- NAT Gateway
- Routing Tables
- EC2-instances (in ASG)
- Autoscaling Group
