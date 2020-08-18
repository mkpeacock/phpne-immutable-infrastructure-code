resource "aws_eip" "eip_for_demo" {
  vpc  = true
  tags = {
    Name        = "${var.ENVIRONMENT_NAME} Elastic IP for Demo"
    Environment = var.ENVIRONMENT_NAME
  }
}

resource "aws_eip_association" "demo_eip_association" {
  instance_id   = aws_instance.demo_host.id
  allocation_id = aws_eip.eip_for_demo.id
}

resource "aws_instance" "demo_host" {
  ami           = var.AIM_TO_DEPLOY
  instance_type = "t2.micro"

  vpc_security_group_ids = [aws_security_group.web_security_group.id]

  tags = {
    Name        = "Demo Server"
    Environment = var.ENVIRONMENT_NAME
  }
}
