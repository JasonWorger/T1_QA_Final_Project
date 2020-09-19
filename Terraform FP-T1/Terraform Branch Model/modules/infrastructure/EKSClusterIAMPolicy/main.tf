# Create an IAM Role to allow our EKS service to manage other AWS services.

resource "aws_iam_role" "cluster_role" {
  name = "FP-T1_cluster_role-${var.environment}"
  description = "Amazon EKS - ${var.environment} - Cluster Group Role"

  assume_role_policy = <<EOF
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Principal": {
          "Service": "eks.amazonaws.com"
        },
        "Action": "sts:AssumeRole"
      }
    ]
  }
  EOF

  tags = {
    Name = "${var.environment} - EKS Cluster Role"
    Project = "FP-T1"
  }
}

# Attach the EKS Cluster Policy to the role.

resource "aws_iam_role_policy_attachment" "eks_cluster_EKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.cluster_role.name
}

# Attach the EKS Service Policy to the role.

resource "aws_iam_role_policy_attachment" "eks_cluster_EKSServicePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
  role       = aws_iam_role.cluster_role.name
}

# Optionally, enable Security Groups for Pods
# Reference: https://docs.aws.amazon.com/eks/latest/userguide/security-groups-for-pods.html

resource "aws_iam_role_policy_attachment" "example-AmazonEKSVPCResourceController" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
  role       = aws_iam_role.cluster_role.name
}