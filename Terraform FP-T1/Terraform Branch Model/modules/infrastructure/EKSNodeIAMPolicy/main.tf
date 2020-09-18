# Create an IAM Role to allow our EKS service to manage other AWS services.

resource "aws_iam_role" "node_role" {
  name = "FP-T1_node_role-${var.environment}"
  description = "Amazon EKS - ${var.environment} - Node Group Role"

  assume_role_policy = <<EOF
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Principal": {
          "Service": "ec2.amazonaws.com"
        },
        "Action": "sts:AssumeRole"
      }
    ]
  }
  EOF

  tags = {
    Name = "${var.environment} - EKS Node Group Role"
    Project = "FP-T1"
  }
}

# Attach the EKS Worker Node Policy to the role.

resource "aws_iam_role_policy_attachment" "eks_cluster_EKSWorkerNodePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.node_role.name
}

# Attach the EKS CNI Policy to the role.

resource "aws_iam_role_policy_attachment" "eks_cluster_EKS_CNI_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role = aws_iam_role.node_role.name
}

# Attach the EC2 Container Registry Read Only Policy to this role.

resource "aws_iam_role_policy_attachment" "eks_cluster_CR_ReadOnly_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role = aws_iam_role.node_role.name
}
