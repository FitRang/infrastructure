output "atlas_project_id" {
  value = mongodbatlas_project.this.id
}

output "cluster_name" {
  value = mongodbatlas_cluster.this.name
}

output "connection_string_private_srv" {
  value = mongodbatlas_cluster.this.connection_strings[0].private_srv
}

output "connection_string_standard_srv" {
  value = mongodbatlas_cluster.this.connection_strings[0].standard_srv
}

output "database_username" {
  value = mongodbatlas_database_user.this.username
}

output "atlas_vpc_cidr" {
  value = mongodbatlas_network_container.this.atlas_cidr_block
}
