output "public_subnet_az1_id" {
  value       = aws_subnet.public_subnet_az_1.id
  description = "The AWS ID for our public subnet 1, within our main VPC."
}

output "public_subnet_az2_id" {
  value       = aws_subnet.public_subnet_az_2.id
  description = "The AWS ID for our public subnet 2, within our main VPC."
}


output "private_eks_subnet_az1_id" {
  value       = aws_subnet.private_eks_subnet_1.id
  description = "The AWS ID for the private subnet 1, within the main VPC."
}

output "private_eks_subnet_az2_id" {
  value       = aws_subnet.private_eks_subnet_2.id
  description = "The AWS ID for the private subnet 2, within the main VPC."
}


output "rds_subnet_name" {
  value       = aws_db_subnet_group.rds_subnet_group.name
  description = "The name of our db subnet group, within the main VPC."
}

output "rds_subnet_1_id" {
  value       = aws_subnet.private_rds_subnet_az1.id
  description = "The ID of our db subnet 1, within the main VPC."
}

output "rds_subnet_2_id" {
  value       = aws_subnet.private_rds_subnet_az2.id
  description = "The ID of our db subnet 2, within the main VPC."
}