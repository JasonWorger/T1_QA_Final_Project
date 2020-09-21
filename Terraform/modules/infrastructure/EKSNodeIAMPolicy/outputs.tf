output "EKSNodeIAMPolicyARN" {
  value       = aws_iam_role.node_role.arn
  description = "The ARM on our newly created EKS Node Policy."
}