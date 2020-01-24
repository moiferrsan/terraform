resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
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

resource "aws_security_group" "allow_http" {
  name        = "allowhttp"
  description = "Permite acesso http"
  vpc_id      = "${aws_vpc.web.id}"

  ingress {
    from_port   = 80
    to_port     = 80
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
    Name = "allow_http"

       }
 }

