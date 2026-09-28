variable "region" {
  description = "AWS region."
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Environment name."
  type        = string
  default     = "dev"
}

variable "name" {
  description = "Resource name prefix."
  type        = string
  default     = "banking-dev"
}

variable "cluster_name" {
  description = "EKS cluster name."
  type        = string
  default     = "banking-dev"
}

variable "vpc_cidr" {
  description = "VPC CIDR."
  type        = string
  default     = "10.10.0.0/16"
}

variable "azs" {
  description = "Availability zones."
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "public_subnets" {
  description = "Public subnet CIDRs."
  type        = list(string)
  default     = ["10.10.0.0/20", "10.10.16.0/20", "10.10.32.0/20"]
}

variable "private_subnets" {
  description = "Private subnet CIDRs."
  type        = list(string)
  default     = ["10.10.128.0/20", "10.10.144.0/20", "10.10.160.0/20"]
}

variable "single_nat_gateway" {
  description = "Use a single NAT gateway (cheaper for dev)."
  type        = bool
  default     = true
}

variable "cluster_version" {
  description = "Kubernetes version."
  type        = string
  default     = "1.31"
}

variable "node_instance_types" {
  description = "Managed node group instance types. t3.xlarge (4 vCPU/16 GB) fits the full stack (32 app pods + Postgres/Kafka/Redis + kube-prometheus-stack + Loki + Tempo + OTel + Argo CD)."
  type        = list(string)
  default     = ["t3.medium"]
}

variable "node_min_size" {
  type    = number
  default = 2
}

variable "node_max_size" {
  type    = number
  default = 3
}

variable "node_desired_size" {
  type    = number
  default = 2
}

variable "ecr_repository_name" {
  description = "Single ECR repository holding all service images."
  type        = string
  default     = "banking-platform"
}

variable "domain_name" {
  description = "Apex domain hosted in Route 53 (delegated from GoDaddy)."
  type        = string
  default     = "vijaygiduthuri.in"
}

variable "create_apex_record" {
  description = "Stage 2: create the apex ALIAS -> Traefik NLB. Set true only after Traefik is installed, then re-apply."
  type        = bool
  default     = false
}
