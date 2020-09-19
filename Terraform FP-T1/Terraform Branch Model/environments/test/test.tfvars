environment = "testing"
region = "eu-west-1"

ssh_key_pair_name = "asbandia-key-pair"

maximum_node_group_size = 2
desired_node_group_size = 1

database_instance_class = "db.t2.micro"
db_root_password = "<NOT THE PASSWORD>"
db_max_allocated_storage = 20

controller_IP_CIDR = "0.0.0.0/0"

vpc_cidr_block = "12.0.0.0/16"

public_cidr_block = "12.0.1.0/24"
private_eks_cidr_block = "12.0.2.0/24"
private_rds_cidr_block = "12.0.3.0/24"
