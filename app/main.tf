provider "aws" {
  region = var.region
}

resource "tls_private_key" "generate-key" {
  algorithm = "RSA"
  rsa_bits  = 4096
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
    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = tls_private_key.generate-key.private_key_pem
      host        = self.public_ip
    }  
    inline = [
      "sudo yum update -y",
      "sudo yum install -y docker",
      "sudo service docker start",
      "docker run -d -p 3000:3000 caio76/index.js"
    ]
  }
}