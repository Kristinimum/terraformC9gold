variable "aws_region" {
    default = "us-east-1"
    type = string
}

#vpc_id
variable "vpc_id" {
    type = string
    default = "vpc-0ec51f31ec9b16cf1"
}

#instance variable
variable "instance_type" {
    description = "Instance type t2.micro"
    type = string
    default = "t2.micro"
}

variable "ami_id" {
    description = "ami-0230bd60aa48260c6"
    type = string
    default = "Amazon Linux Instance"
}

variable "key_name" {
    description = "Key pair for this project"
    type = string
    default = "jenkins-kp"
}

variable "bucket" {
    description = "s3 bucket"
    type = string
    default = "my-tf-jenkins-bucket-grinny-ninny-9879"
}

variable "acl_on_bucket" {
    description = "acl on our bucket"
    type = string
    default = "private"
}