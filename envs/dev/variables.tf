variable "project_id" {
  type = string
}

variable "region" {
  type    = string
  default = "asia-south1"
}

variable "zone" {
  description = "GCP zone to deploy resources"
  type        = string
  default     = "asia-south1-a"
}
