resource "aws_key_pair" "ssl-key" {
  public_key = file("./infra-app/${var.key_name}.pub")
  key_name   = var.key_name

  tags = {
    Environment = var.env
  }


}

resource "aws_default_vpc" "default_vpc" {

}

resource "aws_security_group" "security_group" {
  name        = "${var.env}-infra-security-group"
  description = "A security Group"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "${var.env}-security-group"
  }

}


resource "aws_instance" "ec2_instance" {
  count                  = var.instance_count
  depends_on             = [aws_default_vpc.default_vpc, aws_key_pair.ssl-key, aws_security_group.security_group]
  vpc_security_group_ids = [aws_security_group.security_group.id]
  key_name               = aws_key_pair.ssl-key.key_name
  instance_type          = var.instance_type
  ami                    = var.ami_id
  root_block_device {
    volume_size = var.storage
    volume_type = "gp3"
  }
  tags = {
  
    "name"        = var.instance_name
    "Environment" = var.env
  }

}