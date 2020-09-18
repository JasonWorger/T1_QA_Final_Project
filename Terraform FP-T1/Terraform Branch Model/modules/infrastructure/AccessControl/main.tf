# A network access control list for our private subnet.

resource "aws_network_acl" "private_acl" {
  vpc_id = var.vpc_id
  subnet_ids = [var.private_subnet_id]

  egress {
    protocol   = "tcp"
    rule_no    = 200
    action     = "allow"
    cidr_block = "10.3.0.0/18"
    from_port  = 443
    to_port    = 443
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "10.3.0.0/18"
    from_port  = 80
    to_port    = 80
  }

  tags = {
    Name = "${var.environment} = ${var.region} - Private NACL"
  }
}

# A network access control list for our public subnet.

resource "aws_network_acl" "public_acl" {
  vpc_id = var.vpc_id
  subnet_ids = [var.public_subnet_id]

  egress {
    protocol   = "tcp"
    rule_no    = 200
    action     = "allow"
    cidr_block = "10.3.0.0/18"
    from_port  = 443
    to_port    = 443
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "10.3.0.0/18"
    from_port  = 80
    to_port    = 80
  }

  tags = {
    Name = "${var.environment} = ${var.region} - Public NACL"
  }
}

