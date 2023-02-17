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

variable "cloud9_default_role_exists" {
  description = "Flag to create instance profile and role if they dont exist"
  type        = bool
  default     = false
}

variable "cloud9_vpc" {
  description = "Object to store VPC details for Cloud9 Environment"
  type = object({
    cidr                = string
    azs                 = list(string)
    public_subnet_cidrs = list(string)
  })
}
