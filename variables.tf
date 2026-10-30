
variable "myregion" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "myami" {
  description = "Amazon Linux 2023 AMI"
  type        = string
  default     = "ami-0225644bfadc204f7"
}

variable "myinstance" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "mykey" {
  description = "Existing AWS EC2 key pair name"
  type        = string
  default     = "NV-Key"
}
