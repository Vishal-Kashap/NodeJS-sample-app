
# NodeJS-sample-app

## AWS Infrastructure with Terraform

This project deploys a complete AWS infrastructure using Terraform. It includes the setup of VPC, ECR, ECS, RDS, S3, IAM roles, and security groups. The infrastructure supports an EC2 instance running a Node.js application in a Docker container.

## Project Overview

The setup involves the following components:

1. **Terraform Configuration**: Provisions AWS resources, including:
   - VPC
   - ECR (Elastic Container Registry)
   - EC2 (Elastic Compute Cloud)
   - ECS (Elastic Container Service)
   - RDS (Relational Database Service)
   - S3 (Simple Storage Service)
   - IAM roles
   - Security groups

2. **EC2 User Data Script**: Configures the EC2 instance to:
   - Install necessary packages (Datadog agent, Docker, AWS CLI)
   - Clone a Node.js sample application from GitHub
   - Build and push a Docker image to ECR
   - Run the Docker container on the EC2 instance

## Getting Started

### Prerequisites

- [Terraform](https://www.terraform.io/downloads) 
- [Jenkins](https://www.jenkins.io/download/)

### Setup

1. **Clone the Repository**

   ```bash
   git clone https://github.com/Vishal-Kashap/your-repository.git
   ```

2. **Define Configuration for Terraform Resources**

   Modify the values in the `variables.tf` file for your specific resource configuration:

   ```bash
   vim NodeJS-sample-app/terraform_files/variables.tf
   ```

3. **Create a Jenkins Pipeline**

   - Copy the pipeline script from the `jenkins-pipeline` subdirectory of the downloaded repository.
   - Save the workspace.

4. **Define Permissions for Jenkins**

   - Edit the sudoers file:

     ```bash
     sudo visudo
     ```

   - Add the following line to grant Jenkins permission to run Terraform:

     ```bash
     jenkins ALL=(ALL) NOPASSWD: /usr/bin/terraform
     ```

5. **Place Terraform Files for Execution**

   - Copy the Terraform files to the Jenkins workspace:

     ```bash
     cp -r NodeJS-sample-app/jenkins-pipeline/* /var/lib/jenkins/workspaces/pipeline_name/
     ```

6. **Build the Jenkins Pipeline**

   - Click **Build Now** in the pipeline created.
   - Check the console output to verify the pipeline is working correctly.
   - Wait for the workflow to complete successfully. Resources will be created, and the EC2 instance will run the user data script to deploy the Node.js application.

7. **Verify the Deployment**

   Browse to the public IP of the EC2 instance with port `3000`:

   ```bash
   http://ec2_instance_public_ip:3000
   ```

   Replace `ec2_instance_public_ip` with the actual public IP address of your EC2 instance.
