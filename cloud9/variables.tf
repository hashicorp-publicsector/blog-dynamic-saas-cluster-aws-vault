variable "region" {
  description = "Region for Cloud9 Instance.  Ensure this matches the region used for the root folder"
  type        = string
}

variable "cloud9_auto_stop_minutes" {
  description = "Minutes to automatically shut down Cloud9 if idle"
  type        = number
}

variable "cloud9_instance_size" {
  description = "Instance size for Cloud9 environment"
  type        = string
}
