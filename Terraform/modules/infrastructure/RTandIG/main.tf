# Create Internet Gateway

resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = var.vpc_id

  tags = {
    Name    = "${var.environment} - Internet Gateway"
    Project = "FP-T1"
  }
}

# Create EKS Private Route Table

resource "aws_route_table" "eks_private_route_table" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }

  tags = {
    Name    = "${var.environment} - EKS Private Route Table"
    Project = "FP-T1"
  }
}

# Create EKS Public Route Table

resource "aws_route_table" "eks_public_route_table" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }

  tags = {
    Name    = "${var.environment} - EKS Public Route Table"
    Project = "FP-T1"
  }
}

# Create EKS Private Route Table Association

resource "aws_route_table_association" "eks_private_route_table_asc" {
  route_table_id = aws_route_table.eks_private_route_table.id
  subnet_id = var.private_eks_subnet_id
}

# Create EKS Public Route Table Association

resource "aws_route_table_association" "eks_public_route_table_asc" {
  route_table_id = aws_route_table.eks_public_route_table.id
  subnet_id = var.public_subnet_id
}