# Create an IAM Role to allow our EKS service to manage other AWS services.

resource "aws_iam_role" "cluster_role" {
  name = "FP-T1_cluster_role"

  assume_role_policy = <<POLICY
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
POLICY
}

# Attach the EKS Cluster Policy to the role.

resource "aws_iam_role_policy_attachment" "demo-cluster-AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = "${aws_iam_role.cluster_role.name}"
}

# Attach the EKS Service Policy to the role.

resource "aws_iam_role_policy_attachment" "demo-cluster-AmazonEKSServicePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
  role       = "${aws_iam_role.cluster_role.name}"
}