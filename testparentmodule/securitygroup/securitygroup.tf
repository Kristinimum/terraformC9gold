#-----security-group-----#

resource "aws_security_group" "web_sg" {
  name        = "woofers_sg"
  description = "for web traffic"


  ingress {
    description = "HTTP access"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}



output "web_sg" {
  value = aws_security_group.web_sg.id
}