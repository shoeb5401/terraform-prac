variable "ami" {
  default = "ami-0f918f7e67a3323f0"
  type    = string
}

variable "storage" {
  default = 20
  type    = number
}

variable "instance_type" {
  default = "t2.micro"
  type    = string
}

variable "instance_name" {
  default = "Dev-EC2-instance"
  type    = string
}

variable "Env" {
  default = "dev"
  type = string
}


variable "keyname" {
  default = "dev-key"
  type = string
}

variable "bucket-name" {
  default = "Dev-terraform-bucket-3084-5401"
  type = string
  
}
