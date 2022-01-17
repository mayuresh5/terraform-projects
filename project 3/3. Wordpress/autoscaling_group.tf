################################################################################
# Autoscaling group
################################################################################

resource "aws_autoscaling_group" "my_ASG" {
  name                 = "wordpress-ASG"
  vpc_zone_identifier  = data.aws_subnet_ids.available_db_subnet.ids
  min_size             = var.min_size
  max_size             = var.max_size
  desired_capacity     = var.desired_capacity
  launch_configuration = aws_launch_configuration.my_LC.name
  target_group_arns    = [aws_lb_target_group.my_TG.arn]

  tag {
    key                 = "Name"
    value               = "wordpress-app-server"
    propagate_at_launch = true
  }

  depends_on = [
    aws_lb_target_group.my_TG
  ]
}