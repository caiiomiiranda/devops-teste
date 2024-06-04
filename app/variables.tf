variable "region" {
  description = "AWS Region"
  default     = "us-east-1"
}

variable "ami" {
  description = "AMI of Instance"
  default     = "ami-00beae93a2d981137"
}

variable "instance_type" {
  description = "Instance Type"
  default     = "t2.micro"
}

variable "private_key_path" {
  description = "Private Key SSH"
  default = "id_rsa"
}

variable "aws_access_key" {
  description = "AWS Access Key"
}

variable "aws_secret_key" {
  description = "AWS Secret Key"
}

variable "key_name" {
  description = "SSH Key"
  default = "terraform_aws"
}