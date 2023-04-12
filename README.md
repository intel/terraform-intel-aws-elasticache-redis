<p align="center">
  <img src="https://github.com/intel/terraform-intel-aws-postgresql/blob/main/images/logo-classicblue-800px.png?raw=true" alt="Intel Logo" width="250"/>
</p>

# Intel® Cloud Optimization Modules for Terraform

© Copyright 2022, Intel Corporation

## AWS Elasticache Redis module

This module will create an Amazon Elasticache Redis Cluster based on Intel and creates a new or existing VPC. This module leverages the cache.r5.large by default which is the latest Intel Xeon processor available at the time of this module publication. 

As you configure your application's environment, choose the configurations for your infrastructure that matches your application's requirements.



## Usage

## Description
This module provisions [ElastiCache_Replication_Group](https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/Clusters.html) and
[Parameter Group](https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/ParameterGroups.html).

This module builds using recommended settings:

- Enable Multi-AZ
- Enable automatic failover
- Enable at-rest encryption
- Enable in-transit encryption
- Enable automated backups



```hcl
region
Intel Instance size
Any tags you wish to have applied


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
| engine_version             | The version number of the cache engine to be used for the cache clusters in this replication group.                       | `string`       | `"6.x"`                |    no    |
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

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_elasticache_parameter_group.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_parameter_group) | resource |
| [aws_elasticache_replication_group.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_replication_group) | resource |
| [aws_elasticache_subnet_group.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_subnet_group) | resource |
| [aws_security_group.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.egress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.ingress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_apply_immediately"></a> [apply\_immediately](#input\_apply\_immediately) | Specifies whether any modifications are applied immediately, or during the next maintenance window. | `bool` | `false` | no |
| <a name="input_at_rest_encryption_enabled"></a> [at\_rest\_encryption\_enabled](#input\_at\_rest\_encryption\_enabled) | Whether to enable encryption at rest. | `bool` | `true` | no |
| <a name="input_automatic_failover_enabled"></a> [automatic\_failover\_enabled](#input\_automatic\_failover\_enabled) | Specifies whether a read-only replica will be automatically promoted to read/write primary if the existing primary fails. | `bool` | `true` | no |
| <a name="input_description"></a> [description](#input\_description) | The description of the all resources. | `string` | `"Managed by Terraform"` | no |
| <a name="input_engine_version"></a> [engine\_version](#input\_engine\_version) | The version number of the cache engine to be used for the cache clusters in this replication group. | `string` | `"5.0.6"` | no |
| <a name="input_family"></a> [family](#input\_family) | The family of the ElastiCache parameter group. | `string` | `"redis5.0"` | no |
| <a name="input_maintenance_window"></a> [maintenance\_window](#input\_maintenance\_window) | Specifies the weekly time range for when maintenance on the cache cluster is performed. | `string` | `""` | no |
| <a name="input_name"></a> [name](#input\_name) | The replication group identifier. This parameter is stored as a lowercase string. | `string` | n/a | yes |
| <a name="input_node_type"></a> [node\_type](#input\_node\_type) | The compute and memory capacity of the nodes in the node group. | `string` | n/a | yes |
| <a name="input_num_cache_clusters"></a> [num\_cache\_clusters](#input\_num\_cache\_clusters) | The number of cache clusters (primary and replicas) this replication group will have. | `string` | n/a | yes |
| <a name="input_port"></a> [port](#input\_port) | The port number on which each of the cache nodes will accept connections. | `number` | `6379` | no |
| <a name="input_snapshot_retention_limit"></a> [snapshot\_retention\_limit](#input\_snapshot\_retention\_limit) | The number of days for which ElastiCache will retain automatic cache cluster snapshots before deleting them. | `number` | `30` | no |
| <a name="input_snapshot_window"></a> [snapshot\_window](#input\_snapshot\_window) | The daily time range (in UTC) during which ElastiCache will begin taking a daily snapshot of your cache cluster. | `string` | `""` | no |
| <a name="input_source_cidr_blocks"></a> [source\_cidr\_blocks](#input\_source\_cidr\_blocks) | List of source CIDR blocks. | `list(string)` | n/a | yes |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | List of VPC Subnet IDs for the cache subnet group. | `list(string)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to all resources. | `map(string)` | `{}` | no |
| <a name="input_transit_encryption_enabled"></a> [transit\_encryption\_enabled](#input\_transit\_encryption\_enabled) | Whether to enable encryption in transit. | `bool` | `true` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC Id to associate with Redis ElastiCache. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_elasticache_parameter_group_id"></a> [elasticache\_parameter\_group\_id](#output\_elasticache\_parameter\_group\_id) | The ElastiCache parameter group name. |
| <a name="output_elasticache_replication_group_id"></a> [elasticache\_replication\_group\_id](#output\_elasticache\_replication\_group\_id) | The ID of the ElastiCache Replication Group. |
| <a name="output_elasticache_replication_group_member_clusters"></a> [elasticache\_replication\_group\_member\_clusters](#output\_elasticache\_replication\_group\_member\_clusters) | The identifiers of all the nodes that are part of this replication group. |
| <a name="output_elasticache_replication_group_primary_endpoint_address"></a> [elasticache\_replication\_group\_primary\_endpoint\_address](#output\_elasticache\_replication\_group\_primary\_endpoint\_address) | The address of the endpoint for the primary node in the replication group. |
| <a name="output_security_group_arn"></a> [security\_group\_arn](#output\_security\_group\_arn) | The ARN of the Redis ElastiCache security group. |
| <a name="output_security_group_description"></a> [security\_group\_description](#output\_security\_group\_description) | The description of the Redis ElastiCache security group. |
| <a name="output_security_group_egress"></a> [security\_group\_egress](#output\_security\_group\_egress) | The egress rules of the Redis ElastiCache security group. |
| <a name="output_security_group_id"></a> [security\_group\_id](#output\_security\_group\_id) | The ID of the Redis ElastiCache security group. |
| <a name="output_security_group_ingress"></a> [security\_group\_ingress](#output\_security\_group\_ingress) | The ingress rules of the Redis ElastiCache security group. |
| <a name="output_security_group_name"></a> [security\_group\_name](#output\_security\_group\_name) | The name of the Redis ElastiCache security group. |
| <a name="output_security_group_owner_id"></a> [security\_group\_owner\_id](#output\_security\_group\_owner\_id) | The owner ID of the Redis ElastiCache security group. |
| <a name="output_security_group_vpc_id"></a> [security\_group\_vpc\_id](#output\_security\_group\_vpc\_id) | The VPC ID of the Redis ElastiCache security group. |
<!-- END_TF_DOCS -->