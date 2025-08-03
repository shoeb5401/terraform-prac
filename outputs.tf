output "aws_default_vpc" {
  value = aws_default_vpc.default_vpc.arn


}

output "aws_instance_public_ip" {
  value = aws_instance.ec2_instance.public_ip
}


output "aws_key_pair" {
  value = aws_key_pair.ssl-key.key_name
}

output "aws_s3_bucket" {
  value = aws_s3_bucket.s3_bucket.bucket

}
