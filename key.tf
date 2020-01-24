resource "aws_key_pair" "web" {
  key_name   = "web"
  public_key = "${file("~/.ssh/id_rsa.pub")}"
}
