output "public_subnet_id" {
  value = aws_subnet.public_subnet.id
  description = "The AWS ID for our public subnet, within our main VPC."
}
output "private_eks_subnet_id" {
  value = aws_subnet.private_eks_subnet.id
  description = "The AWS ID for the private subnet, within the main VPC."
}

output "rds_subnet_name" {
  value = aws_db_subnet_group.rds_subnet_group.name
  description = "The name of our db subnet group, within the main VPC."
}