##------------ec2resources--child-module----##

resource "aws_instance" "app_server" {
ami = var.ami_id
instance_type = var.instance
 tags = {
     Name = "ExampleAppServerInstance"
 }
}


variable "ami_id" {
type = string
default = "ami-0230bd60aa48260c6"
}

variable "instance" {
    type = string
    default = "t2.micro"
}