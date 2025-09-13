# A Multi-Tier WordPress Blog on AWS

This project demonstrates a fully automated, production-ready architecture for a dynamic WordPress blog on AWS, using **Terraform** as the Infrastructure as Code (IaC) tool. The core goal is to build a scalable and secure web application from the ground up, highlighting the power of automation and modular design.

## Project Description

This project solves several common problems faced when manually deploying infrastructure on a cloud provider. It showcases how to move from a cumbersome, click-based process to a systematic, code-driven approach. The core architecture consists of:

  * **A single EC2 Instance**: Acts as the web server, running WordPress and all necessary code to serve the website. It is placed in a **public subnet** to be accessible to internet traffic.
  * **A single RDS Database**: The heart of the application, storing all dynamic content such as blog posts, user data, and comments. It is securely located in a **private subnet** with no direct internet access.

This two-tier structure ensures that the sensitive data in the database is protected, while the public-facing web server handles all incoming requests.

## Features

  * **100% Infrastructure as Code (IaC)**: The entire AWS infrastructure is defined and managed using Terraform.
  * **Modular Architecture**: The code is broken down into reusable modules for better organization and scalability.
  * **Automated Deployment**: A `user_data` script automatically installs the necessary software (LAMP stack) and configures WordPress on the EC2 instance upon launch.
  * **Dynamic Configuration**: Database credentials and endpoints are dynamically passed to the web server from Terraform's state, eliminating the need to hardcode sensitive information.
  * **Network Segmentation**: Utilizes a VPC with public and private subnets, along with security groups, to enforce strict network isolation and enhance security.

## Project Architecture

The project follows a standard multi-tier design.

  * **VPC**: The central network container for all resources.
  * **Public Subnet**: Hosts the EC2 instance and an Internet Gateway (IGW) for public access.
  * **Private Subnet**: Hosts the RDS database, securely isolated from the public internet.
  * **Security Groups**: Act as virtual firewalls, allowing specific traffic between the EC2 instance and the RDS database while denying all other external access to the database.

## File Structure

The project adheres to a clean, modular structure.

```
.
├── .terraform
├── Modules
│   ├── db
│   ├── Instance
│   ├── SecurityGroups
│   └── VPC
├── .terraform.lock.hcl
├── main.tf
├── provider.tf
├── terraform.tfstate
├── terraform.tfstate.backup
└── userdata.tpl
```

## How to Use

**Prerequisites**

  * Terraform CLI
  * AWS CLI (configured with your credentials)

<!-- end list -->

1.  **Clone the repository**.
    `git clone <repository-url>`
    `cd <project-directory>`
2.  **Initialize Terraform**.
    `terraform init`
3.  **Review the plan** to see the infrastructure that will be created.
    `terraform plan`
4.  **Deploy the infrastructure**.
    `terraform apply`

## About the Author

This project was developed by **[Your Name]** to demonstrate proficiency in Terraform and cloud infrastructure design. This project has given me invaluable hands-on experience with modularization, state management, and troubleshooting real-world cloud infrastructure issues. I am now confident in my ability to build and manage complex cloud environments, and I'm excited to continue using these skills in my career.