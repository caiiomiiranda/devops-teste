provider "aws" {
  region = var.region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key 
}

resource "aws_instance" "server_app_devops" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name

  tags = {
    Name = "app-devops-instance"
  }

    provisioner "remote-exec" {
      inline = [
          "ls -al"
#      "sudo yum update -y",
#      "sudo yum install -y docker",
#      "sudo service docker start",
#      "docker run -d -p 3000:3000 caio76/index.js"
    ]
      connection {
      type        = "ssh"
      user        = "root"
      private_key = "${var.private_key}"
      host        = self.public_ip
    }  
  }

    provisioner "remote-exec" {
      script = "/app/deploy_app.sh" 

    connection {
      type        = "ssh"
      user        = "root"
      private_key = "${var.private_key}"
      host        = self.public_ip
    }
  }
}