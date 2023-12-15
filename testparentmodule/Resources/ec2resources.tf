##------------ec2resources--child-module----##

resource "aws_instance" "app_server" {
  ami                    = var.ami_id
  instance_type          = var.instance
  vpc_security_group_ids = [var.security_groups]

  tags = {
    Name = "ExampleAppServerInstance"
  }
}

variable "ami_id" {
  type    = string
  default = "ami-0230bd60aa48260c6"
}

variable "instance" {
  type    = string
  default = "t2.micro"
}

output "mypublicip" {
  value = aws_instance.app_server.public_ip
}

variable "security_groups" {
  description = "sg from security group module"
}