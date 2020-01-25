resource "aws_lb" "web" {
  name               = "web-app"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [
                       "${aws_security_group.allow_http.id}",
                       "${aws_vpc.web.default_security_group_id}"
                       ]
  subnets            = "${aws_subnet.public.*.id}"

  enable_deletion_protection = false

  tags = {
    Environment = "web"
  }
}

resource "aws_lb_target_group" "web" {
  name     = "web"
  port     = 80
  protocol = "HTTP"
  vpc_id   = "${aws_vpc.web.id}"
  
}

resource "aws_lb_listener" "web" {
  load_balancer_arn = "${aws_lb.web.arn}"
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.web.arn}"
  }
}

resource "aws_lb_target_group_attachment" "nginx" {
  target_group_arn = "${aws_lb_target_group.web.arn}"
  target_id        = "${aws_instance.nginx.id}"
  port             = 80
}

resource "aws_lb_target_group_attachment" "apache" {
  target_group_arn = "${aws_lb_target_group.web.arn}"
  target_id        = "${aws_instance.apache.id}"
  port             = 80
}

