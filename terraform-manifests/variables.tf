#variable "access_key" {
#     description = "Access key to AWS console"
     
#}
#variable "secret_key" {
#     description = "Secret key to AWS console"
     
#}



variable "cidr_block" {
  default     = "10.0.0.0/16"
  type        = string
  description = "CIDR block for the VPC"
}

variable "public_subnet_cidr_blocks" {
  default     = ["10.0.0.0/24", "10.0.2.0/24"]
  type        = list
  description = "List of public subnet CIDR blocks"
}

variable "private_subnet_cidr_blocks" {
  default     = ["10.0.1.0/24", "10.0.3.0/24"]
  type        = list
  description = "List of private subnet CIDR blocks"
}

variable "rds_private_subnet_cidr_blocks" {
  default     = ["10.0.30.0/24", "10.0.40.0/24"]
  type        = list
  description = "List of private subnet CIDR blocks"
}



variable "availability_zones" {
  default     = ["us-east-1a", "us-east-1b"]
  type        = list
  description = "List of availability zones"
}




variable "backup_retention_period" {
  default     = "7"
  type        = string
  description = "backup_retention_period"
}


variable "engine" {
  default     = "postgres"
  type        = string
  description = "RDS engine like mysql postgress"
}

variable "engine_version" {
  default     = "9.6.22"
  type        = string
  description = "engine_version"
}

variable "identifier" {
  default     = "mydb1"
  type        = string
  description = "identifier"
}

variable "instance_class" {
  default     = "db.t2.micro"
  type        = string
  description = "RDS DB instance_class"
}

variable "multi_az" {
  default     = false
  type        = bool
  description = "multi_az"
}

variable "name" {
  default     = "mydb1"
  type        = string
  description = "name"
}

variable "password" {
  default     = "password"
  type        = string
  description = "password"
}

variable "publicly_accessible" {
  default     = false
  type        = bool
  description = "publicly_accessible"
}

variable "storage_encrypted" {
  default     = false
  type        = bool
  description = "storage_encrypted"
}

variable "storage_type" {
  default     = "gp2"
  type        = string
  description = "storage_type"
}

variable "username" {
  default     = "dbtest"
  type        = string
  description = "username"
}

variable "allocated_storage" {
  default     = "20"
  type        = string
  description = "allocated_storage"
}


variable "port" {
  default     = "5432"
  type        = string
  description = "Port"
}










