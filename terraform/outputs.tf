output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.ecommerce_vpc.id
}

output "public_subnet_id" {
  description = "Public Subnet ID"
  value       = aws_subnet.public_subnet.id
}

output "security_group_id" {
  description = "Security Group ID"
  value       = aws_security_group.ecommerce_sg.id
}

output "s3_bucket_name" {
  description = "S3 Bucket Name"
  value       = aws_s3_bucket.ecommerce_bucket.id
}