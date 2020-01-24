resource "aws_instance" "nginx" {
  ami           = "ami-0bf9ef4c7f3e35044"
  instance_type = "t3a.micro"
  availability_zone = "${data.aws_availability_zones.available.names[0]}"
//  vpc_security_group_ids = ["${aws_security_group.allow_ssh.id}"]
  security_groups = [
                     "${aws_security_group.allow_ssh.id}",
                     "${aws_vpc.web.default_security_group_id}"
                    ]
  key_name = "${aws_key_pair.web.key_name}"
  subnet_id = "${aws_subnet.public.0.id}"
  
  provisioner "remote-exec" {
    inline = ["sudo apt-get install nginx -y"]

    connection {
    type = "ssh"
    user = "admin"
    private_key = "${file("~/.ssh/id_rsa")}"
    host = "${aws_instance.nginx.public_ip}"
  }

  }
  
  tags = {
    Name      = "Linux - App nginx"
    Stack     = "Production"
    SO     = "Debian Stretch"
  }
}

output "ip_addres_nginx" {
  value = "${aws_instance.nginx.public_ip}"

}

resource "aws_instance" "apache" {
  ami           = "ami-0bf9ef4c7f3e35044"
  instance_type = "t3a.micro"
  availability_zone = "${data.aws_availability_zones.available.names[1]}"
//  vpc_security_group_ids = ["${aws_security_group.allow_ssh.id}"]
  security_groups = [
                     "${aws_security_group.allow_ssh.id}",
                     "${aws_vpc.web.default_security_group_id}"
                    ]

  key_name = "${aws_key_pair.web.key_name}"
  subnet_id = "${aws_subnet.public.1.id}"
  
  provisioner "remote-exec" {
    inline = ["sudo apt-get install apache2 -y"]

    connection {
    type = "ssh"
    user = "admin"
    private_key = "${file("~/.ssh/id_rsa")}"
    host = "${aws_instance.apache.public_ip}"
  }

  }


  tags = {
    Name      = "Linux - App Apache"
    Stack     = "Production"
    SO     = "Debian Stretch"
  }
}

output "ip_addres_apache" {
  value = "${aws_instance.apache.public_ip}"

}

