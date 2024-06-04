#!/bin/bash
#Fail script if any command fails
set -e
#Update and install Docker
sudo yum update -y
sudo yum install -y docker
sudo service docker start
sudo usermod -a -G docker ec2-user
#Pull and run Docker image
docker pull caio76/index.js
docker run -d -p 3000:3000 caio76/index.js