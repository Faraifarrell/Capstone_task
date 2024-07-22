#You can provide Date value if need to know when its created and what is happening
variable "tagNameDate" {
  default = "16-7-24"
}

# VPC Variables
variable "cidr_blocks" {
  default = ["0.0.0.0/0"]
}

variable "availability_zones" {
  description = "List of availability zones"
  default     = ["us-west-2a", "us-west-2b"] # Replace with your availability zones
}

variable "public_subnet_cidr_blocks" {
  description = "CIDR blocks for public subnets"
  default     = ["10.0.0.0/26", "10.0.0.64/26"] # Adjust as needed
}

variable "private_subnet_cidr_blocks" {
  description = "CIDR blocks for private subnets"
  default     = ["10.0.0.128/26", "10.0.0.192/26"] # Adjust as needed
}

# EC2 Variables
variable "ec2_instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "key_name" {
  description = "Name of the EC2 key pair"
  default     = "vockey"
}

# Variables for RDS DB instance

variable "rds_username" {
  description = "The username for the RDS instance"
  default     = "faraifara"
}
variable "rds_password" {
  description = "The password for the RDS instance"
  default     = "rootpassword#123"
  sensitive   = true
}
variable "rds_db_name" {
  description = "The name of the database"
  default     = "wordpressDb"
}

# SNS email id variable
variable "EMAIL_ID" {
  description = "SNS email id"
}
# Role
variable "LabRoleARN" {
  description = "Lab Role"
  default     = "arn:aws:iam::891377082491:role/LabRole"
}



#S3 bucket Name
variable "s3_bucket_name" {
  description = "Name of the S3 bucket"
  default     = "s3-bucket-16-7-24"
}
