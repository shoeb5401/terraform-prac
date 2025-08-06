module "dev-infra-app" {
  source         = "./infra-app"
  env            = "dev"
  bucket_name    = "terraform-multienv-3084"
  key_name       = "Deployer.pem"
  instance_type  = "t2.micro"
  instance_name  = "terraform-multienv-3084"
  instance_count = 1
  storage        = 20
  ami_id         = "ami-0f918f7e67a3323f0"
  dynamo_name    = "terraform-multienv-3084"
  hash_key       = "LockID"
}
module "prod-infra-app" {
  source         = "./infra-app"
  env            = "prod"
  bucket_name    = "terraform-multienv-3084"
  key_name       = "Deployer.pem"
  instance_type  = "t2.micro"
  instance_name  = "terraform-multienv-3084"
  instance_count = 2
  storage        = 25
  ami_id         = "ami-0f918f7e67a3323f0"
  dynamo_name    = "terraform-multienv-3084"
  hash_key       = "LockID"
}
