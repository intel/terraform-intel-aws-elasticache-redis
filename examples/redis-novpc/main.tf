#########################################################
# Local variables, modify for your needs                #
#########################################################

########################
####     Intel      ####
########################
# At the time of the publication of this module AWS Elasticache Redis clusters only support the 1st or 2nd generation Intel Xeon Platinum 8000 series processor (Skylake-SP or Cascade Lake). We recommend leveraging the Intel Xeon 3rd or 4th Generation Scalable processors (Ice Lake or Saphire Rapids) when AWS makes them available for Elasticache.
# 
# Recommended Intel supported Instance types:
#
# General Purpose: cache.m5.large, cache.m5.xlarge, cache.m5.2xlarge, cache.m5.4xlarge, cache.m5.12xlarge, cache.m5.24xlarge
# Memory Optimized: cache.r5.large, cache.r5.xlarge, cache.r5.2xlarge, cache.r5.4xlarge, cache.r5.12xlarge, cache.r5.24xlarge
#
# This example will create a VPC using 3 AZ's, 2 subnets per AZ, and a NATGW and IGW as part of the deployment.

locals {
  region    = "us-west-2"      # Choose your AWS region you want to build in
  node_type = "cache.r5.large" # See above recommended instance types for Intel Xeon processors 
  vpc_id = "vpc-0787c6805bff6175f" # Replace with the ID of the vpc you want to deploy to.
  cidr_block = "10.0.0.0/16" # Enter the CIDR range of the VPC you are deploying in.
  public_subnets  = ["subnet-075580637758afd4d", "subnet-02981998201b23862", "subnet-0e705f1b5a4080a1b"] # Enter the subnet ID's for your PUBLIC subnets of the VPC you want to deploy to
  private_subnets = ["subnet-0b52f177e487bcfad", "subnet-09aa7f95c2a40279b", "subnet-013c2faa7514d17e7"] # Enter the subnet ID's for your PRIVATE subnets of the VPC you want to deploy to
  tags = {
    Owner    = "user@company.com"
    Duration = "24"
  }
}

module "elasticache_redis" {
  source             = "../../"
  name               = "ApplicationName-Prod" #Name of the Redis cluster you are creating.
  num_cache_clusters = 3
  node_type          = local.node_type
  engine_version             = "6.x"
  port                       = 6379
  maintenance_window         = "mon:10:40-mon:11:40"
  snapshot_window            = "09:10-10:10"
  snapshot_retention_limit   = 1
  automatic_failover_enabled = false
  at_rest_encryption_enabled = false
  transit_encryption_enabled = false
  apply_immediately          = true
  family                     = "redis6.x"
  description = "Redis Cluster"

  subnet_ids         = local.private_subnets
  vpc_id             = local.vpc_id
  source_cidr_blocks = [local.cidr_block]
}

locals {

}

# data "aws_availability_zones" "available" {}
