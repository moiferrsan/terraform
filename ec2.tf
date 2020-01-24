resource "aws_instance" "web" {
  ami           = "ami-0fdd8e81ae22328af"
  instance_type = "t3a.medium"
  availability_zone = "${data.aws_availability_zones.available.names[0]}"
  vpc_security_group_ids = ["${aws_security_group.allow_ssh.id}"]
  security_groups = ["${aws_security_group.allow_ssh.name}"]
  key_name = "${aws_key_pair.web.key_name}"
  subnet_id = "${aws_subnet.public.0.id}"
  tags = {
    Name      = "Linux - App Web"
    Stack     = "Production"
  }
}

output "ip_addres_mobile" {
  value = "${aws_instance.web.private_ip}"

}

