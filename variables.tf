########################
####     Intel      ####
########################

# See policies.md, we recommend  Intel Xeon Scalable processors
# **General:** cache.m5.large, cache.m5.xlarge, cache.m5.2xlarge, cache.m5.4xlarge, cache.m5.12xlarge, cache.m5.24xlarge
# **Memory Optimized:** cache.r5.large, cache.r5.xlarge, cache.r5.2xlarge, cache.r5.4xlarge, cache.r5.12xlarge, cache.r5.24xlarge

variable "node_type" {
  type        = string
  description = "The compute and memory capacity of the nodes in the node group."
  default     = "cache.r5.large"
}

########################
####    Required    ####
########################

variable "name" {
  type        = string
  default     = "ApplicationName-Prod"
  description = "The replication group identifier. This parameter is stored as a lowercase string."
}

variable "num_cache_clusters" {
  type        = string
  default     = "3"
  description = "The number of cache clusters (primary and replicas) this replication group will have."
}


variable "subnet_ids" {
  type        = list(string)
  description = "List of VPC Subnet IDs for the cache subnet group."
}

variable "vpc_id" {
  type        = string
  description = "VPC Id to associate with Redis ElastiCache."
}

variable "source_cidr_blocks" {
  type        = list(string)
  description = "List of source CIDR blocks."
  
}

########################
####     Other      ####
########################

variable "engine_version" {
  default     = "6.x"
  type        = string
  description = "The version number of the cache engine to be used for the cache clusters in this replication group."
}

variable "port" {
  default     = 6379
  type        = number
  description = "The port number on which each of the cache nodes will accept connections."
}

variable "maintenance_window" {
  default     = ""
  type        = string
  description = "Specifies the weekly time range for when maintenance on the cache cluster is performed."
}

variable "snapshot_window" {
  default     = ""
  type        = string
  description = "The daily time range (in UTC) during which ElastiCache will begin taking a daily snapshot of your cache cluster."
}

variable "snapshot_retention_limit" {
  default     = 30
  type        = number
  description = "The number of days for which ElastiCache will retain automatic cache cluster snapshots before deleting them."
}

variable "automatic_failover_enabled" {
  default     = true
  type        = bool
  description = "Specifies whether a read-only replica will be automatically promoted to read/write primary if the existing primary fails."
}

variable "at_rest_encryption_enabled" {
  default     = true
  type        = bool
  description = "Whether to enable encryption at rest."
}

variable "transit_encryption_enabled" {
  default     = true
  type        = bool
  description = "Whether to enable encryption in transit."
}

variable "apply_immediately" {
  default     = true
  type        = bool
  description = "Specifies whether any modifications are applied immediately, or during the next maintenance window."
}

variable "family" {
  default     = "redis6.x"
  type        = string
  description = "The family of the ElastiCache parameter group."
}

variable "description" {
  default     = "Managed by Terraform"
  type        = string
  description = "The description of the all resources."
}

variable "enable_intel_tags" {
  type    = bool
    default = true
  description = "If true adds additional Intel tags to resources"
}

variable "tags" {
  default     = {}
  type        = map(string)
  description = "A mapping of tags to assign to all resources."
}
variable "intel_tags" {
  default     = {
    intel-registry = "https://registry.terraform.io/namespaces/intel"
    intel-module   = "terraform-intel-aws-elasticache-redis"
  }
  type        = map(string)
  description = "Intel Tags"
}
