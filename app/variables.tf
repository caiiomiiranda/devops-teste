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