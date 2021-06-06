output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.landingZone.vpc_id
}

output "public_subnet_ids" {
  description = "List of IDs of public subnets"
  value       = module.landingZone.public_subnet_ids
}

output "private_subnet_ids" {
  description = "List of IDs of private subnets"
  value       = module.landingZone.private_subnet_ids
}

output "public_rtb" {
  description = "Routetable ID associated with public subnets"
  value       = module.landingZone.public_rtb
}

output "private_rtb" {
  description = "Routetable ID associated with private subnets"
  value       = module.landingZone.private_rtb
}

output "public_nacl" {
  description = "NACL ID associated with public subnets"
  value       = module.landingZone.public_nacl
}

output "private_nacl" {
  description = "NACL ID associated with private subnets"
  value       = module.landingZone.private_nacl
}
