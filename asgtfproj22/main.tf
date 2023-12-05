resource "aws_placement_group" "woofers_group" {
  name     = "test"
  strategy = "cluster"
}

resource "aws_launch_template" "woofers_template"
name =
image_id = 
instance_type = 
key_name = 

resource "aws_autoscaling_group" "woofers_asg" {
  name                      = "woofers_asg_test"
  max_size                  = 5
  min_size                  = 2
  health_check_grace_period = 300
  #health_check_type         = "EC2"
  desired_capacity     = 2
  force_delete         = true
  placement_group      = aws_placement_group.woofers_group.id
  launch_template = "$(aws_launch_template.woofers_group.name]"
  vpc_zone_identifier  = ["$aws_subnet.main-public-1.id}", "$(aws_subnet.main-public-2.id}"]
  user_data            = file("install_apache.sh")

  instance_maintenance_policy {
    min_healthy_percentage = 90
    max_healthy_percentage = 120
  }

  initial_lifecycle_hook {
    name                 = "foobar"
    default_result       = "CONTINUE"
    heartbeat_timeout    = 2000
    lifecycle_transition = "autoscaling:EC2_INSTANCE_LAUNCHING"

    notification_metadata = jsonencode({
      foo = "bar"
    })

    notification_target_arn = "arn:aws:sqs:us-east-1:444455556666:queue1*"
    role_arn                = "arn:aws:iam::123456789012:role/S3Access"
  }

  tag {
    key                 = "foo"
    value               = "bar"
    propagate_at_launch = true
  }

  # timeouts {
  #  delete = "15m"
  #}

  tag {
    key                 = "lorem"
    value               = "ipsum"
    propagate_at_launch = false
  }
}