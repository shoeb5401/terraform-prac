variable "env" {
  description = "This is the variable defined for the environment"
  type        = string
}
variable "bucket_name" {
  description = "Name of the S3 Bucket"
  type        = string
}

variable "key_name" {
  description = "Name of the key generated"
  type        = string

}
variable "instance_type" {
  description = "Computational types for the Ec2 instance"
  type        = string

}
variable "instance_name" {
  description = "Name of Instance "
  type        = string

}
variable "instance_count" {
  description = "number of  ec2 instance to create "
  type        = number

}
variable "storage" {
  description = "storage for the ec2 root block"
  type        = number

}

variable "ami_id" {
  description = "AMI Id for the instance OS."
  type = string
  default = "ami-0f918f7e67a3323f0"
}

variable "dynamo_name" {
  description = "Name for the Dynamo DB table"
  type = string
  
}
variable "hash_key" {
  description = "Name for the Hash Key"
  type = string
  
}
