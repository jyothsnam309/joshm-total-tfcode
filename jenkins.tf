resource "aws_security_group" "cicd-jen" {
  name        = "cicd-jen-sg"
  description = "acess the end user "
  vpc_id      = "vpc-020e39c61ad892bfd"

  ingress {
    description = "connecting with enduser"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }


  ingress {
    description = "connecting with enduser"
    from_port   = 8080
    to_port     = 8080
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
    Name = "cicd-jen-sg"
  }
}


resource "aws_instance" "cicd-jen" {
  ami           = "ami-01216e7612243e0ef"
  instance_type = "c5.2xlarge"
  vpc_id = "vpc-020e39c61ad892bfd"
  subnet_id              = "subnet-01b5985f32594823a"
  vpc_security_group_ids = [aws_security_group.cicd-jen.id]
  #iam_instance_profile = "aws_iam_instance_profile.artifactory.name"
  #  key_name        = ${aws_key_pair.dev.id}
  key_name  = aws_key_pair.demo1.id




  tags = {
    Name = "cicd-jen"
  }
}

#lifecycle {
#  create_before_destroy = true
#}
#}
