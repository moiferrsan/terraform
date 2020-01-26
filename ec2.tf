// Criação Servidor Web Nginx
resource "aws_instance" "server-nginx" {
  ami           = "ami-0bf9ef4c7f3e35044"
  instance_type = "t3a.micro"
  availability_zone = "${data.aws_availability_zones.available.names[0]}"
  security_groups = [
                     "${aws_security_group.allow_ssh.id}",
                     "${aws_vpc.corp.default_security_group_id}"
                    ]
  key_name = "${aws_key_pair.key-web.key_name}"
  subnet_id = "${aws_subnet.public.0.id}"
// Instalação do pacote na ec2  
  provisioner "remote-exec" {
    inline = ["sudo apt-get install nginx -y"]

    connection {
    type = "ssh"
    user = "admin"
    private_key = "${file("~/.ssh/id_rsa")}"
    host = "${aws_instance.server-nginx.public_ip}"
  }

  }
  
  tags = {
    Name      = "Linux - App nginx"
    Stack     = "Production"
    SO     = "Debian Stretch"
  }
}
//Criação servidor Web Apache
resource "aws_instance" "server-apache" {
  ami           = "ami-0bf9ef4c7f3e35044"
  instance_type = "t3a.micro"
  availability_zone = "${data.aws_availability_zones.available.names[1]}"
  security_groups = [
                     "${aws_security_group.allow_ssh.id}",
                     "${aws_vpc.corp.default_security_group_id}"
                    ]

  key_name = "${aws_key_pair.key-web.key_name}"
  subnet_id = "${aws_subnet.public.1.id}"
  
// Instalação do pacote na ec2  
  provisioner "remote-exec" {
    inline = ["sudo apt-get install apache2 -y"]

    connection {
    type = "ssh"
    user = "admin"
    private_key = "${file("~/.ssh/id_rsa")}"
    host = "${aws_instance.server-apache.public_ip}"
  }

  }


  tags = {
    Name      = "Linux - App Apache"
    Stack     = "Production"
    SO     = "Debian Stretch"
  }
}


