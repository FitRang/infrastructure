variable "project_id" {
  type = string
}

variable "region" {
  type = string
}

variable "kafka_cluster_id" {
  type = string
}

variable "subnet_id" {
  type = string
  description = "Full self-link of the subnet where Kafka will attach"
}
