provider "aws" {
  region = var.region
  #  access_key = var.aws_access_key
  #  secret_key = var.aws_secret_key 
}

resource "tls_private_key" "generate-key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "private_key" {
  content  = tls_private_key.generate-key.private_key_pem
  filename = "/root/project/deployer-key.pem"
  file_permission = "0600"
}

resource "aws_key_pair" "key-pair" {
  key_name = "key-pair"
  public_key = tls_private_key.generate-key.public_key_openssh
}

resource "aws_instance" "server_app_devops" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = aws_key_pair.key-pair.key_name

  tags = {
    Name = "app-devops-instance"
  }
    provisioner "remote-exec" {
      inline = [
      "sudo yum update -y",
      "sudo yum install -y docker",
      "sudo service docker start",
      "docker run -d -p 3000:3000 caio76/index.js"
    ]
    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = "/root/project/deployer-key.pem"
      host        = self.public_ip
    }
  }
}