resource "aws_security_group" "allow_ssh" {
  name        = "sgwebapp"
  description = "Permite acesso ssh"
  vpc_id      = "${aws_vpc.web.id}"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]

        }
 
tags = {
    Name = "allow_ssh"
 
       }
 }
