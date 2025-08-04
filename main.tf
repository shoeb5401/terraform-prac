resource "aws_key_pair" "ssl-key" {
  public_key = file("Login.pem.pub")
  key_name   = var.keyname


}

resource "aws_default_vpc" "default_vpc" {

}

resource "aws_security_group" "security_group" {

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

}


resource "aws_instance" "ec2_instance" {

  
  vpc_security_group_ids = [aws_security_group.security_group.id]
  key_name               = aws_key_pair.ssl-key.key_name
  instance_type          = var.instance_type
  ami                    = "ami-0f918f7e67a3323f0"
  root_block_device {
    volume_size = var.storage
    volume_type = "gp3"
  }
  user_data = file("startup.sh")
  tags = {
    "name" = var.instance_name
    "Environment" = var.Env
  }

}

resource "aws_s3_bucket" "s3_bucket" {
  bucket = var.bucket-name

}
