# AWS VPC and Public EC2 Web Server using Terraform

## Project Overview

This project demonstrates Infrastructure as Code (IaC) using Terraform to provision AWS infrastructure and deploy a simple Apache web server on an EC2 instance.

The infrastructure was created and tested using the KodeKloud Terraform + AWS Playground.

## Architecture

The project provisions the following AWS resources:

1. **VPC** – Custom Virtual Private Cloud with CIDR `10.0.0.0/16`.
2. **Public Subnet** – Subnet with CIDR `10.0.1.0/24`.
3. **Internet Gateway** – Provides internet connectivity to the VPC.
4. **Public Route Table** – Routes internet-bound traffic (`0.0.0.0/0`) through the Internet Gateway.
5. **Route Table Association** – Associates the public subnet with the route table.
6. **Security Group** – Allows inbound HTTP traffic on port 80.
7. **EC2 Instance** – Amazon Linux 2023 instance using `t2.micro`.
8. **Apache Web Server** – Installed and started automatically using EC2 User Data.

## Technologies Used

- AWS
- Terraform
- HCL
- Amazon Linux 2023
- Apache HTTP Server
- Linux Shell Scripting

## Project Structure

```text
01-aws-vpc-public-web-server/
├── provider.tf
├── main.tf
├── outputs.tf
├── .gitignore
├── .terraform.lock.hcl
└── README.md
```

## Terraform Commands

Initialize Terraform:

```bash
terraform init
```

Format configuration:

```bash
terraform fmt
```

Validate configuration:

```bash
terraform validate
```

Preview infrastructure changes:

```bash
terraform plan
```

Deploy infrastructure:

```bash
terraform apply
```

View Terraform outputs:

```bash
terraform output
```

Destroy infrastructure when no longer required:

```bash
terraform destroy
```

## Automated Web Server Deployment

The EC2 instance uses a User Data shell script to:

- Update installed packages.
- Install Apache HTTP Server.
- Enable Apache at system startup.
- Start the Apache service.
- Create a custom HTML homepage.

## Deployment Verification

The deployment was successfully tested in the KodeKloud AWS Playground using:

```bash
curl http://<EC2-PUBLIC-IP>
```

Expected response:

```html
<h1>My First Terraform AWS Web Server</h1>
```

## Key Learning Outcomes

- Creating AWS infrastructure using Terraform.
- Understanding Terraform providers and resources.
- Managing resource dependencies through Terraform references.
- Configuring VPC networking and public routing.
- Implementing Security Groups.
- Deploying EC2 instances using Terraform.
- Automating application installation using EC2 User Data.
- Managing Terraform outputs and project files.

## Security Notes

- Terraform state files and AWS credentials must never be committed to GitHub.
- SSH access is not enabled in this project's Security Group.
- HTTP port 80 is publicly accessible for this demonstration.
- The playground deployment uses temporary lab infrastructure.

## Author

Sravan Kumar Boosa

GitHub: https://github.com/SravanBoosa
