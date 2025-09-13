variable "vpc_cidr" {
  description = "The CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "The CIDR block for the public subnet."
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_1_cidr" {
  description = "The CIDR block for the first private subnet."
  type        = string
  default     = "10.0.2.0/24"
}

variable "private_subnet_2_cidr" {
  description = "The CIDR block for the second private subnet."
  type        = string
  default     = "10.0.3.0/24"
}

variable "region" {
  description = "The AWS region to create resources in."
  type        = string
  default     = "us-east-1"
}

variable "public_az" {
  description = "The availability zone for the public subnet."
  type        = string
  default     = "us-east-1a"
}

variable "private_az_1" {
  description = "The availability zone for the first private subnet."
  type        = string
  default     = "us-east-1a"
}

variable "private_az_2" {
  description = "The availability zone for the second private subnet."
  type        = string
  default     = "us-east-1b"
}