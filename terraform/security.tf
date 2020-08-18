resource "aws_security_group" "web_security_group" {
  name = "${var.ENVIRONMENT_NAME} Web Security Group"

  ingress {
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    description      = "HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
  }

  ingress {
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    description      = "HTTPS"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${var.ENVIRONMENT_NAME} Web Security Group"
    Environment = var.ENVIRONMENT_NAME
  }
}
