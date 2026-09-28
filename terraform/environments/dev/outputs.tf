output "vpc_id" {
  value = module.vpc.vpc_id
}

output "private_subnet_ids" {
  value = module.vpc.private_subnet_ids
}

output "public_subnet_ids" {
  value = module.vpc.public_subnet_ids
}

output "eks_cluster_role_arn" {
  value = module.iam.cluster_role_arn
}

output "eks_node_role_arn" {
  value = module.iam.node_role_arn
}

output "cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "cluster_name" {
  value = module.eks.cluster_name
}

output "oidc_provider_arn" {
  value = module.eks.oidc_provider_arn
}

output "ecr_repository_url" {
  value = module.ecr.repository_url
}

output "documents_bucket" {
  value = module.s3_documents.bucket_name
}

#output "route53_zone_id" {
# value = module.route53.zone_id
#}

# Paste these 4 nameservers into GoDaddy (Domain -> Nameservers).
#output "route53_name_servers" {
# value = module.route53.name_servers
}

output "apex_fqdn" {
  value = module.route53.apex_fqdn
}
