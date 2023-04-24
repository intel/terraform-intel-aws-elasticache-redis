<p align="center">
  <img src="./images/logo-classicblue-800px.png" alt="Intel Logo" width="250"/>
</p>

# Intel® Cloud Optimization Modules for Terraform  

© Copyright 2022, Intel Corporation

## HashiCorp Sentinel Policies

This file documents the HashiCorp Sentinel policies that apply to this module

## AWS Elasticache Redis Policy

Description: The configured "instance_types" should be Intel Xeon 3rd Generation(code-named Ice Lake). At the time of publication of this policy, Elasticache does not enable any Ice Lake or Intel 4th gen Xeon Scalable processors (code named Sapphire Rapids).

Resource type: autoscaling

Parameter: instance_types

Allowed Types

- **General:** cache.m5.large, cache.m5.xlarge, cache.m5.2xlarge, cache.m5.4xlarge, cache.m5.12xlarge, cache.m5.24xlarge
- **Memory Optimized:** cache.r5.large, cache.r5.xlarge, cache.r5.2xlarge, cache.r5.4xlarge, cache.r5.12xlarge, cache.r5.24xlarge