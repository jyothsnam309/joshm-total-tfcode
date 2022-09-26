data "http" "myip" {
  url = "http://ipv4.icanhazip.com"
}




resource "aws_security_group" "cicd-apache" {
  name        = "cicd-apache-sg"
  description = "acess the end user "
  vpc_id      = "vpc-020e39c61ad892bfd"


  ingress {
    description = "connecting with enduser"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }


  ingress {
    description = "connecting with admin"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "cicd-apache-sg"
  }
}


resource "aws_instance" "cicd-apache" {
  ami           = "ami-01216e7612243e0ef"
  instance_type = "t2.micro"
  vpc_id = "vpc-020e39c61ad892bfd"
  subnet_id              = "subnet-01b5985f32594823a"
  vpc_security_group_ids = [aws_security_group.cicd-apache.id]
  #  key_name        = ${aws_key_pair.dev.id}
  key_name  = aws_key_pair.demo1.id

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install httpd -y
              systemctl start httpd
              systemctl enable httpd
              EOF
  



  tags = {
    Name = "cicd-tomcat"
  }
}
