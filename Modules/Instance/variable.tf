variable "subnet_id" {
  description = "The ID of the subnet to launch the instance in."
  type        = string
}

variable "sg_id" {
  description = "The ID of the security group to associate with the instance."
  type        = string
}

variable "userdata" {
  description = "The user data to provide when launching the instance."
  type        = string
}

variable "instance_type" {
  description = "The type of instance to launch."
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "The name of the key pair to use for the instance."
  type        = string
  default     = "EC2-KEYPAIR"
}