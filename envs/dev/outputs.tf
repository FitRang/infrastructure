output "vpc_network_id" {
  value = module.vpc.network_id
}

output "subnet_id" {
  value = module.vpc.subnet_id
}

output "redis_host" {
  value = module.redis.host
}

output "redis_port" {
  value = module.redis.port
}

output "bucket_name" {
  value = module.bucket.bucket_name
}

output "bastion_public_ip" {
  value = module.bastion_vm.public_ip
}

output "bastion_private_ip" {
  value = module.bastion_vm.private_ip
}

output "mongodb_connection_string" {
  value = module.mongodb.connection_string_private_srv
}
