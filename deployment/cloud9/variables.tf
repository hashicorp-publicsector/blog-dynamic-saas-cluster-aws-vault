variable "region" {
  description = "Region for Cloud9 Instance.  Ensure this matches the region used for the root folder"
  type        = string
  default     = "us-east-2"
}

variable "cloud9_auto_stop_minutes" {
  description = "The number of minutes until the running instance is shut down after the environment has last been used"
  type        = number
  default     = 1800
}

variable "cloud9_instance_size" {
  description = "Instance size for Cloud9 environment"
  type        = string
  default     = "t3.medium"
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
  default = {
    azs                 = ["us-east-2a", "us-east-2b"]
    cidr                = "192.168.0.0/16"
    public_subnet_cidrs = ["192.168.0.0/24", "192.168.1.0/24"]
  }
}

/*
variable "cloud9_image_id" {
  description = "The identifier for the Amazon Machine Image (AMI) that's used to create the EC2 instance"
  type        = string
  default     = "amazonlinux-2-x86_64"
}
*/
