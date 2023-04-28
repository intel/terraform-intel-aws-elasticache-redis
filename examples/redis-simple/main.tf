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

# Choose the AWS region to deploy in
locals {
  region    = "us-east-2"  
}

# This example will create a VPC using 3 AZ's, 2 subnets per AZ, and a NATGW and IGW as part of the deployment.
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 3.0"
  cidr    = "10.99.0.0/18"          #Choose the cidr block you want to use for your VPC
  name    = "vpc-elasticache-redis" #Choose the name you want to give the VPC
  /* public_subnet_cidr_blocks = [cidrsubnet(local.cidr_block, 8, 0), cidrsubnet(local.cidr_block, 8, 1)]
  public_availability_zones = data.aws_availability_zones.available.names */
  azs             = ["${local.region}a", "${local.region}b", "${local.region}c"]
  public_subnets  = ["10.99.0.0/24", "10.99.1.0/24", "10.99.2.0/24"] #Adjust if you choose a different CIDR block
  private_subnets = ["10.99.3.0/24", "10.99.4.0/24", "10.99.5.0/24"] #Adjust if you choose a different CIDR block

  enable_nat_gateway      = true
  single_nat_gateway      = true
  enable_dns_hostnames    = true
  map_public_ip_on_launch = false

}

module "elasticache_redis" {
  source             = "../../"
  subnet_ids         = module.vpc.private_subnets
  vpc_id             = module.vpc.vpc_id
  source_cidr_blocks = [module.vpc.vpc_cidr_block]
}
