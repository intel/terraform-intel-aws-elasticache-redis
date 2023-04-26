<p align="center">
  <img src="https://github.com/intel/terraform-intel-aws-elasticache-redis/blob/main/images/logo-classicblue-800px.png?raw=true" alt="Intel Logo" width="250"/>
</p>

# Intel® Cloud Optimization Modules for Terraform

© Copyright 2022, Intel Corporation

## AWS Elasticache Redis module - Existing VPC Example

This example creates an Amazon Elasticache Redis Cluster based on Intel in an existing VPC. This module leverages the cache.r5.large by default which is the latest Intel Xeon processor available at the time of this module publication. 

As you configure your application's environment, choose the configurations for your infrastructure that matches your application's requirements.



## Usage

## Description
This module provisions [ElastiCache_Replication_Group](https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/Clusters.html) and
[Parameter Group](https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/ParameterGroups.html).

This module requires a vpc with multiple AZ's (3)

- Enable Multi-AZ
- Enable automatic failover
- Enable at-rest encryption
- Enable in-transit encryption
- Enable automated backups

By default, you will only have to pass these variables in the **/examples/redis-novpc/main.tf** file

```hcl
module "elasticache_redis" {
  region          = "us-west-2"                                                           # Choose your AWS region you want to build in
  public_subnets  = ["<YOUR-subnet-zoneA>", "<YOUR-subnet-zoneB>", "<YOUR-subnet-zoneC>"] #Specify your 3 seperate public subnets in 3 different AZ's
  tags = {
    Owner    = "user@company.com"
    Duration = "24"
  }
  source                     = "intel/aws-elasticache-redis/intel"
  name                       = "ApplicationName-Prod" #Name of the Redis cluster you are creating.
  num_cache_clusters         = 3
  node_type                  = "cache.r5.large"
  maintenance_window         = "mon:10:40-mon:11:40"
  snapshot_window            = "09:10-10:10"
  apply_immediately          = true
  
  subnet_ids         = ["<YOUR-subnet-zoneA>", "<YOUR-subnet-zoneB>", "<YOUR-subnet-zoneC>"] #Specify your 3 seperate private subnets in 3 different AZ's
  vpc_id             = "<YOUR-VPC-ID-HERE>"  
  source_cidr_blocks = "10.0.0.0/16"
}


```

Run Terraform

```hcl

terraform init  
terraform plan
terraform apply 
```

Note that this example may create resources. Run `terraform destroy` when you don't need these resources.

## Considerations

- Adjust your region you want to create this module by modifying the entry in the locals section of the module. It is defaulted to run in us-east-2 region within AWS. If you want to run it within any other region, make changes accordingly within the Terraform code


- Check if you getting errors while running this Terraform code due to AWS defined soft limits or hard limits within your AWS account. Please work with your AWS support team to resolve limit constraints

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.3.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.36.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|


## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_region"></a> [region](#input\_region) | Target AWS region to deploy workloads in. | `string` | `"us-east-2"` | no |

## Outputs


| Name                       | Description                                                                                                               | Type           | Default                  | Required |
| -------------------------- | ------------------------------------------------------------------------------------------------------------------------- | -------------- | ------------------------ | :------: |
| name                       | The replication group identifier. This parameter is stored as a lowercase string.                                         | `string`       | n/a                      |   yes    |
| node_type                  | The compute and memory capacity of the nodes in the node group.                                                           | `string`       | n/a                      |   yes    |
| number_cache_clusters      | The number of cache clusters (primary and replicas) this replication group will have.                                     | `string`       | n/a                      |   yes    |
| source_cidr_blocks         | List of source CIDR blocks.                                                                                               | `list(string)` | n/a                      |   yes    |
| subnet_ids                 | List of VPC Subnet IDs for the cache subnet group.                                                                        | `list(string)` | n/a                      |   yes    |
| vpc_id                     | VPC Id to associate with Redis ElastiCache.                                                                               | `string`       | n/a                      |   yes    |
| apply_immediately          | Specifies whether any modifications are applied immediately, or during the next maintenance window.                       | `bool`         | `false`                  |    no    |
| at_rest_encryption_enabled | Whether to enable encryption at rest.                                                                                     | `bool`         | `true`                   |    no    |
| automatic_failover_enabled | Specifies whether a read-only replica will be automatically promoted to read/write primary if the existing primary fails. | `bool`         | `true`                   |    no    |
| description                | The description of the all resources.                                                                                     | `string`       | `"Managed by Terraform"` |    no    |
| engine_version             | The version number of the cache engine to be used for the cache clusters in this replication group.                       | `string`       | `"6.x.6"`                |    no    |
| family                     | The family of the ElastiCache parameter group.                                                                            | `string`       | `"redis6.0"`             |    no    |
| maintenance_window         | Specifies the weekly time range for when maintenance on the cache cluster is performed.                                   | `string`       | `""`                     |    no    |
| port                       | The port number on which each of the cache nodes will accept connections.                                                 | `number`       | `6379`                   |    no    |
| snapshot_retention_limit   | The number of days for which ElastiCache will retain automatic cache cluster snapshots before deleting them.              | `number`       | `30`                     |    no    |
| snapshot_window            | The daily time range (in UTC) during which ElastiCache will begin taking a daily snapshot of your cache cluster.          | `string`       | `""`                     |    no    |
| tags                       | A mapping of tags to assign to all resources.                                                                             | `map(string)`  | `{}`                     |    no    |
| transit_encryption_enabled | Whether to enable encryption in transit.                                                                                  | `bool`         | `true`                   |    no    |

## Outputs

| Name                                                   | Description                                                                |
| ------------------------------------------------------ | -------------------------------------------------------------------------- |
| elasticache_parameter_group_id                         | The ElastiCache parameter group name.                                      |
| elasticache_replication_group_id                       | The ID of the ElastiCache Replication Group.                               |
| elasticache_replication_group_member_clusters          | The identifiers of all the nodes that are part of this replication group.  |
| elasticache_replication_group_primary_endpoint_address | The address of the endpoint for the primary node in the replication group. |
| security_group_arn                                     | The ARN of the Redis ElastiCache security group.                           |
| security_group_description                             | The description of the Redis ElastiCache security group.                   |
| security_group_egress                                  | The egress rules of the Redis ElastiCache security group.                  |
| security_group_id                                      | The ID of the Redis ElastiCache security group.                            |
| security_group_ingress                                 | The ingress rules of the Redis ElastiCache security group.                 |
| security_group_name                                    | The name of the Redis ElastiCache security group.                          |
| security_group_owner_id                                | The owner ID of the Redis ElastiCache security group.                      |
| security_group_vpc_id                                  | The VPC ID of the Redis ElastiCache security group.                        |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
