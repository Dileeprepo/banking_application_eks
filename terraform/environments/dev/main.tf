# Dev environment: full AWS foundation for the platform.

data "aws_caller_identity" "current" {}

module "vpc" {
  source = "../../modules/vpc"

  name               = var.name
  cidr               = var.vpc_cidr
  azs                = var.azs
  public_subnets     = var.public_subnets
  private_subnets    = var.private_subnets
  cluster_name       = var.cluster_name
  single_nat_gateway = var.single_nat_gateway
}

module "iam" {
  source = "../../modules/iam"

  name = var.name
}

module "eks" {
  source = "../../modules/eks"

  cluster_name       = var.cluster_name
  cluster_version    = var.cluster_version
  vpc_id             = module.vpc.vpc_id
  private_subnet_ids = module.vpc.private_subnet_ids
  cluster_role_arn   = module.iam.cluster_role_arn
  node_role_arn      = module.iam.node_role_arn

  node_instance_types = var.node_instance_types
  node_min_size       = var.node_min_size
  node_max_size       = var.node_max_size
  node_desired_size   = var.node_desired_size
}

module "ecr" {
  source = "../../modules/ecr"

  repository_name = var.ecr_repository_name
}

module "s3_documents" {
  source = "../../modules/s3"

  bucket_name = "${var.name}-documents-${data.aws_caller_identity.current.account_id}"
}

# DNS: apex hosted zone (+ optional apex ALIAS -> Traefik NLB in stage 2).
# See docs/aws/05-dns-godaddy.md for the two-stage apply + GoDaddy delegation.
 # module "route53" {
 # source = "../../modules/route53"

  # domain_name        = var.domain_name
  # create_apex_record = var.create_apex_record
  # }
