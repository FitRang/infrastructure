variable "project_id" {
  type        = string
  description = "GCP project ID"
}

variable "zone" {
  type        = string
  description = "GCP zone for the VM"
}

variable "machine_type" {
  type        = string
  default     = "e2-micro"
  description = "Machine type for bastion VM"
}

variable "vm_name" {
  type        = string
  default     = "bastion"
  description = "Name of the VM"
}

variable "network_id" {
  type        = string
  description = "VPC network ID"
}

variable "subnet_id" {
  type        = string
  description = "VPC subnet ID"
}

variable "disk_image" {
  type        = string
  default     = "debian-cloud/debian-12"
  description = "Boot disk image"
}

variable "disk_size_gb" {
  type        = number
  default     = 10
  description = "Boot disk size in GB"
}

variable "tags" {
  type        = list(string)
  default     = ["bastion"]
  description = "Network tags for the VM"
}
