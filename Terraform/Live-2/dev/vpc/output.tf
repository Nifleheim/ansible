output "vpc_id" {
  value = module.vpc.vpc_id
}

output "private_subnets_ids" {
  value = module.vpc.private_subnets_ids
}

output "public_subnets_ids" {
  value = module.vpc.public_subnets_ids
}

#optionally, we can use outputs var if we want to display them in the console