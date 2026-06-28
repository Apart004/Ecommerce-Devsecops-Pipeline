terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

# VPC
resource "aws_vpc" "ecommerce_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name        = "ecommerce-vpc"
    Environment = var.environment
  }
}

# VPC Flow Logs
resource "aws_flow_log" "ecommerce_vpc_flow_log" {
  vpc_id          = aws_vpc.ecommerce_vpc.id
  traffic_type    = "ALL"
  iam_role_arn    = aws_iam_role.flow_log_role.arn
  log_destination = aws_cloudwatch_log_group.flow_log_group.arn
}

resource "aws_cloudwatch_log_group" "flow_log_group" {
  name              = "/aws/vpc/flow-logs"
  retention_in_days = 90
}

resource "aws_iam_role" "flow_log_role" {
  name = "vpc-flow-log-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "vpc-flow-logs.amazonaws.com"
        }
      }
    ]
  })
}

# Public Subnet
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.ecommerce_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "${var.aws_region}a"
  map_public_ip_on_launch = false

  tags = {
    Name        = "ecommerce-public-subnet"
    Environment = var.environment
  }
}

# Security Group
resource "aws_security_group" "ecommerce_sg" {
  name        = "ecommerce-sg"
  description = "Security group for e-commerce app"
  vpc_id      = aws_vpc.ecommerce_vpc.id

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "ecommerce-sg"
    Environment = var.environment
  }
}

# S3 Bucket for static assets
resource "aws_s3_bucket" "ecommerce_bucket" {
  bucket = "${var.environment}-ecommerce-assets"

  tags = {
    Name        = "ecommerce-assets"
    Environment = var.environment
  }
}

# S3 Bucket versioning
resource "aws_s3_bucket_versioning" "ecommerce_bucket_versioning" {
  bucket = aws_s3_bucket.ecommerce_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

# S3 Bucket encryption
resource "aws_s3_bucket_server_side_encryption_configuration" "ecommerce_bucket_encryption" {
  bucket = aws_s3_bucket.ecommerce_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# S3 Block Public Access
resource "aws_s3_bucket_public_access_block" "ecommerce_bucket_public_access" {
  bucket                  = aws_s3_bucket.ecommerce_bucket.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# S3 Access Logging bucket
resource "aws_s3_bucket" "log_bucket" {
  bucket = "${var.environment}-ecommerce-logs"

  tags = {
    Name        = "ecommerce-logs"
    Environment = var.environment
  }
}

resource "aws_s3_bucket_public_access_block" "log_bucket_public_access" {
  bucket                  = aws_s3_bucket.log_bucket.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# S3 Access Logging
resource "aws_s3_bucket_logging" "ecommerce_bucket_logging" {
  bucket        = aws_s3_bucket.ecommerce_bucket.id
  target_bucket = aws_s3_bucket.log_bucket.id
  target_prefix = "access-logs/"
}