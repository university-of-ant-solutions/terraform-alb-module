# Default ALB implementation that can be used connect ECS instances to it

locals {
  security_group_alb  = "${var.security_group_alb}-${var.service_name}"
  alb_name            = "${var.alb_name}-${var.service_name}"
}

resource "aws_alb_target_group" "default" {
  name                 = "tg-${local.alb_name}"
  port                 = 80
  protocol             = "HTTP"
  vpc_id               = "${var.vpc_id}"
  deregistration_delay = "${var.deregistration_delay}"

  health_check {
    path     = "${var.health_check_path}"
    protocol = "HTTP"
  }

  tags {}
}

resource "aws_alb" "alb" {
  name            = "${local.alb_name}"
  subnets         = ["${var.public_subnets}"]
  security_groups = ["${aws_security_group.alb.id}"]

  tags {}
}

resource "aws_alb_listener" "https" {
  load_balancer_arn = "${aws_alb.alb.id}"
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = "${aws_alb_target_group.default.id}"
    type             = "forward"
  }
}

resource "aws_security_group" "alb" {
  name   = "${local.security_group_alb}"
  vpc_id = "${var.vpc_id}"

  tags {}
}

resource "aws_security_group_rule" "https_from_anywhere" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "TCP"
  cidr_blocks       = ["${var.allow_cidr_block}"]
  security_group_id = "${aws_security_group.alb.id}"
}

resource "aws_security_group_rule" "outbound_internet_access" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.alb.id}"
}
