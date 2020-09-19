# Create a new VPC.

resource "aws_vpc" "VPC" {
  cidr_block = var.vpc_cidr_block

  tags = {
    Name = "${var.environment} - VPC"
    Project = "FP-T1"
    "kubernetes.io/cluster/${var.cluster_name}" = shared  # Makes our VPC discoverable by kubernetes.
  }
}
