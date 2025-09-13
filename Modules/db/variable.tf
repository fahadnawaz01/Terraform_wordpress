variable "private_subnet_ids" {
  description = "The IDs of the private subnets to place the database in."
  type        = list(string)
}

variable "private_sg_id" {
  description = "The ID of the security group for the database."
  type        = string
}

variable "db_username" {
  description = "The username for the database."
  type        = string
  default     = "fahad"
}

variable "db_password" {
  description = "The password for the database."
  type        = string
  default     = "fahad12345"
}

variable "db_name" {
  description = "The name of the database."
  type        = string
  default     = "mydb"
}

variable "db_instance_class" {
  description = "The instance class for the database."
  type        = string
  default     = "db.t3.micro"
}