variable "aws_region" {
    default = "us-east-1"
    type = string
}

#instance variable
variable "instance_type" {
    description = "Instance type t2.micro"
    type = string
    default = "t2.micro"
}

variable "ami_id" {
    type = string
    default = "ami-0230bd60aa48260c6"
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

variable "acl" {
    description = "acl on our bucket"
    type = string
    default = "private"
}