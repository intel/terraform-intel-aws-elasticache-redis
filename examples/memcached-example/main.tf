#########################################################
# Local variables, modify for your needs                #
#########################################################

########################
####     Intel      ####
########################

# At the time of the publication of this module AWS Elasticache Memcache clusters only support the 1st or 2nd generation Intel Xeon Platinum 8000 series processor (Skylake-SP or Cascade Lake). We recommend leveraging the Intel Xeon 3rd or 4th Generation Scalable processors (Ice Lake or Saphire Rapids) when AWS makes them available for Elasticache.
# Instance types supported:
# General Purpose: cache.m5.large, cache.m5.xlarge, cache.m5.2xlarge, cache.m5.4xlarge, cache.m5.12xlarge, cache.m5.24xlarge
# Memory Optimized: cache.r5.large, cache.r5.xlarge, cache.r5.2xlarge, cache.r5.4xlarge, cache.r5.12xlarge, cache.r5.24xlarge

/* locals {
  enabled = true
  region = "us-east-2"
  availability_zones = ["us-east-2a", "us-east-2b"]
  namespace = "eg"
  #sg_name = "blahblahblahyou"
  stage = "test"
  name = "testredis"
  # Utilizing Intel Architecture
  node_type = "cache.m5.xlarge"
  # See above recommended instance types for Intel Xeon Scalable processors
  cluster_size = 1
  family = "redis6.x"
  engine_version = "6.x"
  at_rest_encryption_enabled = false
  transit_encryption_enabled = true
  zone_id = "Z3SO0TKDDQ0RGG"
  cloudwatch_metric_alarms_enabled = false
} */
#########################################################
# End of local variables                                #
#########################################################

resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "My VPC"
  }
}

resource "aws_subnet" "my_subnet" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.1.0/24"
  tags = {
    Name = "My Subnet"
  }
}

resource "aws_elasticache_cluster" "my_elasticache" {
  cluster_id           = "my-elasticache-cluster"
  engine               = "memcached"
  node_type            = "cache.t2.micro"
    engine_version       = "1.4.33"
  num_cache_nodes      = 1
  subnet_group_name    = "my-subnet-group"
  vpc_security_group_ids = [aws_security_group.my_security_group.id]
}

resource "aws_security_group" "my_security_group" {
  name_prefix = "my-elasticache-security-group"

  ingress {
    from_port = 11211
    to_port   = 11211
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_elasticache_subnet_group" "my_subnet_group" {
  name       = "my-subnet-group"
  subnet_ids = [aws_subnet.my_subnet.id]
}