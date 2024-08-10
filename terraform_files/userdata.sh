#!/bin/bash

# Update and install required packages
sudo apt update -y
DD_API_KEY="your_datadog_api_key" DD_SITE="us5.datadoghq.com" bash -c "$(curl -L https://install.datadoghq.com/scripts/install_script_agent7.sh)"
sudo apt install docker.io -y
sudo snap install aws-cli --classic 

# Docker login
sudo docker login -u your_docker_username -p your_docker_password

# Clone the repository
git clone https://github.com/your_github_username/NodeJS-sample-app.git
cd NodeJS-sample-app

# Configure AWS CLI (Replace placeholders with your actual values)
aws configure <<EOF
your_aws_access_key
your_aws_secret_key
us-east-1
json
EOF

# ECR login and Docker operations
aws ecr get-login-password --region us-east-1 | sudo docker login --username AWS --password-stdin your_ecr_registry_id.dkr.ecr.us-east-1.amazonaws.com
sudo docker build -t nodejs .
sudo docker tag nodejs:latest your_ecr_registry_id.dkr.ecr.us-east-1.amazonaws.com/nodejs-repo:nodejs
sudo docker push your_ecr_registry_id.dkr.ecr.us-east-1.amazonaws.com/nodejs-repo:nodejs
sudo docker pull your_ecr_registry_id.dkr.ecr.us-east-1.amazonaws.com/nodejs-repo:nodejs

# Run Docker container
sudo docker run -p 3000:3000 your_ecr_registry_id.dkr.ecr.us-east-1.amazonaws.com/nodejs-repo:nodejs
