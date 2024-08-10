# For Provider

variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "us-east-1"
}


# For ECR 

variable "ecr_repo_name" {
  description = "The name of the ECR repository"
  type        = string
  default     = "nodejs-repo"  # Optional: Default value
}

# For IAM Role

variable "ecs_task_execution_role_name" {
  description = "The name of the ECS task execution IAM role"
  type        = string
  default     = "ecsTaskExecutionRole48"  # Optional: Default value
}

variable "ecs_task_execution_policy_arn" {
  description = "The ARN of the ECS task execution role policy"
  type        = string
  default     = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"  # Optional: Default value
}


# For VPC

variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr_block" {
  description = "The CIDR block for the public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_a_cidr_block" {
  description = "The CIDR block for the first private subnet"
  type        = string
  default     = "10.0.2.0/24"
}

variable "private_subnet_b_cidr_block" {
  description = "The CIDR block for the second private subnet"
  type        = string
  default     = "10.0.3.0/24"
}

variable "availability_zone_a" {
  description = "The availability zone for the public subnet"
  type        = string
  default     = "us-east-1a"
}

variable "availability_zone_b" {
  description = "The availability zone for the first private subnet"
  type        = string
  default     = "us-east-1b"
}

variable "availability_zone_c" {
  description = "The availability zone for the second private subnet"
  type        = string
  default     = "us-east-1c"
}

# For Main.tf (Instance)

variable "ami_id" {
  description = "The AMI ID for the instance"
  type        = string
  default     = "ami-04a81a99f5ec58529"
}

variable "instance_type" {
  description = "The instance type for the EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "The name of the key pair"
  type        = string
  default     = "vishal"
}

variable "instance_tag_name" {
  description = "The Name tag for the instance"
  type        = string
  default     = "terraform"
}


# For RDS

variable "allocated_storage" {
  description = "The allocated storage size for the RDS instance (in GB)"
  type        = number
  default     = 30
}

variable "storage_type" {
  description = "The storage type for the RDS instance"
  type        = string
  default     = "gp2"
}

variable "engine" {
  description = "The database engine to use for the RDS instance"
  type        = string
  default     = "mysql"
}

variable "instance_class" {
  description = "The instance class for the RDS instance"
  type        = string
  default     = "db.t3.micro"
}

variable "db_username" {
  description = "The master username for the RDS instance"
  type        = string
  default     = "wordpress"
}

variable "db_password" {
  description = "The master password for the RDS instance"
  type        = string
  sensitive   = true
  default     = "12345678"  # Optional: You might not want to set a default here
}

variable "db_subnet_group_name" {
  description = "The name of the DB subnet group"
  type        = string
  default     = "mydb-subnet-group"
}

#For S3 bucket

variable "s3_bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
  default     = "my-bucket-for-nodejs"
}

variable "s3_bucket_tags" {
  description = "Tags for the S3 bucket"
  type        = map(string)
  default     = {
    Name = "my-bucket-for-nodejs"
  }
}

