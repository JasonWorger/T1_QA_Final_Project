# Create a new VPC.

resource "aws_vpc" "VPC" {
  cidr_block = var.vpc_cidr_block
  enable_dns_hostnames = true
  enable_dns_support = true

  tags = {
    Name                                        = "${var.environment} - VPC"
    Project                                     = "FP-T1"
    "kubernetes.io/cluster/${var.cluster_name}" = "shared" # Makes our VPC discoverable by kubernetes.
  }
}
