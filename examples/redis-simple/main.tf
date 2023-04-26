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

module "elasticache_redis" {
  region         = "us-west-2"                                                           # Choose your AWS region you want to build in
  public_subnets = ["<YOUR-subnet-zoneA>", "<YOUR-subnet-zoneB>", "<YOUR-subnet-zoneC>"] #Specify your 3 seperate public subnets in 3 different AZ's
  tags = {
    Owner    = "user@company.com"
    Duration = "24"
  }
  source             = "intel/aws-elasticache-redis/intel"
  name               = "ApplicationName-Prod" #Name of the Redis cluster you are creating.
  num_cache_clusters = 3
  node_type          = "cache.r5.large"
  maintenance_window = "mon:10:40-mon:11:40"
  snapshot_window    = "09:10-10:10"
  apply_immediately  = true

  subnet_ids         = ["<YOUR-subnet-zoneA>", "<YOUR-subnet-zoneB>", "<YOUR-subnet-zoneC>"] #Specify your 3 seperate private subnets in 3 different AZ's
  vpc_id             = "<YOUR-VPC-ID-HERE>"
  source_cidr_blocks = "10.0.0.0/16"
}
