#####################################################################
## AWS Target Group
#####################################################################

resource "aws_lb_target_group" "my_TG" {
  name     = "wordpress-TG"
  port     = 80
  protocol = "HTTP"
  vpc_id   = data.aws_vpc.vpc_available.id
  load_balancing_algorithm_type = "round_robin"

  health_check {
    path = "/wp-admin/install.php"          # '/' for default
    port = 80
    healthy_threshold = 2
    unhealthy_threshold = 5
    timeout = 100
    interval = 200
    matcher = "200,302"  # has to be HTTP 200 or fails
  }

  stickiness {    
    type            = "lb_cookie"    
    cookie_duration = 36000   
    enabled         = true
  }
}