#Launch Template-needs to be created to make Auto Scaling Group. Needs a key pair.
resource "aws_launch_template" "apache_template" {
  name          = var.name
  image_id           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  user_data     = file("install_apache.sh")
  tags = {
    Name = "Woofers"
  }
}

#Auto Scaling Group-must specify availibility zones
resource "aws_autoscaling_group" "woofers_apache_asg" {
  name               = var.name
  availability_zones = var.availability_zones
  desired_capacity   = 2
  max_size           = 5
  min_size           = 2
  #need to specify what version of the template to use.
  launch_template {
    id      = aws_launch_template.apache_template.id
    version = aws_launch_template.apache_template.latest_version
  }
}
