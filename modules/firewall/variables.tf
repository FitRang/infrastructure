variable "project_id" {
  type        = string
  description = "GCP project ID"
}

variable "network_id" {
  type        = string
  description = "VPC network self link or name"
}

variable "ssh_source_ranges" {
  type        = list(string)
  description = "CIDR ranges allowed to SSH into bastion"
  default     = []
}
