# Amazon EKS requires subnets in at least two Availability Zones.

# Create a public subnet for our front end load balancers.
# These will pass traffic onto pods in our private subnet.

resource "aws_subnet" "public_subnet" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.public_cidr_block
  map_public_ip_on_launch = true

  tags = {
    Name                                        = "${var.environment} - Public Subnet"
    Project                                     = "FP-T1"
    "kubernetes.io/cluster/${var.cluster_name}" = "shared" # Makes our VPC discoverable by kubernetes.
    "kubernetes.io/role/elb"                    = 1      # Indicates that this subnet is to be used for load balancing.
  }
}

# Create a private subnet for our secure containerised application.

resource "aws_subnet" "private_eks_subnet" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.private_eks_cidr_block
  map_public_ip_on_launch = false

  tags = {
    Name                                        = "${var.environment} - Private EKS Subnet"
    Project                                     = "FP-T1"
    "kubernetes.io/cluster/${var.cluster_name}" = "shared" # Makes our VPC discoverable by kubernetes.
  }
}

data "aws_availability_zones" "available_zones" {
  state = "available"
}


# Create a two private subnets for our database instance.

resource "aws_subnet" "private_rds_subnet_az1" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.private_rds_1_cidr_block
  map_public_ip_on_launch = false
  availability_zone = data.aws_availability_zones.available_zones.names[0]

  tags = {
    Name    = "${var.environment} - Private RDS Subnet AZ1"
    Project = "FP-T1"
  }
}

resource "aws_subnet" "private_rds_subnet_az2" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.private_rds_2_cidr_block
  map_public_ip_on_launch = false
  availability_zone = data.aws_availability_zones.available_zones.names[1]

  tags = {
    Name    = "${var.environment} - Private RDS Subnet AZ2"
    Project = "FP-T1"
  }
}


resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "${var.environment}-rds_subnet_group"
  subnet_ids = [aws_subnet.private_rds_subnet_az1.id, aws_subnet.private_rds_subnet_az2.id]

  tags = {
    Name    = "${var.environment} - Private RDS Subnet Group"
    Project = "FP-T1"
  }
}