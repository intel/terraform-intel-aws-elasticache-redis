<p align="center">
  <img src="https://github.com/intel/terraform-intel-aws-elasticache-redis/blob/main/images/logo-classicblue-800px.png?raw=true" alt="Intel Logo" width="250"/>
</p>

# Intel® Cloud Optimization Modules for Terraform  

© Copyright 2022, Intel Corporation

## HashiCorp Sentinel Policies

This file documents the HashiCorp Sentinel policies that apply to this module

## AWS Elasticache Redis Policy

Description: The configured "node_type" should be Intel Xeon 2nd Generation(code-named Cascade Lake). At the time of publication of this policy, Elasticache does not enable any Intel Xeon 3rd gen(code-named Ice Lake) or Intel Xeon 4th Gen Scalable processors (code-named Sapphire Rapids).

Resource type: aws_elasticache_replication_group

Parameter: node_type

Allowed Types

- **General:** cache.m5.large, cache.m5.xlarge, cache.m5.2xlarge, cache.m5.4xlarge, cache.m5.12xlarge, cache.m5.24xlarge
- **Memory Optimized:** cache.r5.large, cache.r5.xlarge, cache.r5.2xlarge, cache.r5.4xlarge, cache.r5.12xlarge, cache.r5.24xlarge
