#####################################################################
## AWS Target Group
#####################################################################

resource "aws_lb_target_group" "my_TG" {
  name     = "wordpress-TG"
  port     = 80
  protocol = "HTTP"
  vpc_id   = data.aws_vpc.vpc_available.id
}