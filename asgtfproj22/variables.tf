variable "region" {
  type    = string
  default = "us-east-1"
}

#instance variable
variable "instance_type" {
  description = "Instance type t2.micro"
  type        = string
  default     = "t2.micro"
}

variable "name" {
  type    = string
  default = "wooferswk22proj"
}
variable "ami_id" {
  description = "Amazon Linux Instance"
  type        = string
  default     = "ami-0fa1ca9559f1892ec"
}

variable "key_name" {
  description = "Key pair for this project"
  type        = string
  default     = "jenkins-kp"
}

variable "availability_zones" {
  type    = list(string)
  default = (["us-east-1a", "us-east-1d"])
}

variable "vpc_id" {
  type    = string
  default = "vpc-0ec51f31ec9b16cf1"
}