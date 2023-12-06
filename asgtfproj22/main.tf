resource "aws_placement_group" "woofers_group" {
  name     = "test"
  strategy = "cluster"
}

resource "aws_default_vpc" "default" {
  default_vpc = "vpc-0ec51f31ec9b16cf1"
  tags = {
    Name = "Default VPC"
  }
}

resource "aws_launch_template" "woofers_template" {
  name_prefix   = "terraform-asg"
  image_id      = "ami-0fa1ca9559f1892ec"
  instance_type = "t2.micro"
  user_data     = file("install_apache.sh")

}

resource "aws_autoscaling_group" "woofers_asg" {
  name                      = "woofers_asg_test"
  max_size                  = 5
  min_size                  = 2
  health_check_grace_period = 300
  #health_check_type         = "EC2"
  desired_capacity    = 2
  force_delete        = true
  placement_group     = aws_placement_group.woofers_group.id
  launch_template     = [aws_launch_template.woofers_template]
  vpc_zone_identifier = ["$aws_subnet.main-public-1.id}", "$(aws_subnet.main-public-2.id}"]

}



resource "aws_security_group" "woofers_instance" {
  name = "learn-asg-woofers-instance"
  ingress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
    #security_groups = [aws_security_group.terramino_lb.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  vpc_id = "vpc-0ec51f31ec9b16cf1"
}
