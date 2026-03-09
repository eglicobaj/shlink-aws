resource "aws_security_group" "egress" {
  name   = "egress"
  vpc_id = module.vpc.vpc_id

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = { Name = "egress" }
}

resource "aws_security_group" "public_ssh" {
  name        = "public-ssh"
  description = "SSH from anywhere (like the example zip)"
  vpc_id      = module.vpc.vpc_id

  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = { Name = "public_ssh" }
}

resource "aws_security_group" "load_balancer" {
  name        = "load-balancer"
  description = "HTTP/HTTPS from internet"
  vpc_id      = module.vpc.vpc_id

  ingress {
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    protocol    = "tcp"
    from_port   = 443
    to_port     = 443
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = { Name = "load-balancer" }
}

resource "aws_security_group" "balanced_instance" {
  name        = "balanced-instance"
  description = "Allow any TCP from the ALB + self"
  vpc_id      = module.vpc.vpc_id

  tags = { Name = "balanced-instance" }
}

resource "aws_security_group_rule" "balanced_instance_lb_ingress" {
  security_group_id        = aws_security_group.balanced_instance.id
  type                     = "ingress"
  protocol                 = "tcp"
  from_port                = 0
  to_port                  = 0
  source_security_group_id = aws_security_group.load_balancer.id
}

resource "aws_security_group_rule" "balanced_instance_self_ingress" {
  security_group_id        = aws_security_group.balanced_instance.id
  type                     = "ingress"
  protocol                 = "tcp"
  from_port                = 0
  to_port                  = 0
  source_security_group_id = aws_security_group.balanced_instance.id
}