provider "aws" {
region = "us-east-2"
}
resource "aws_instance" "myawsserver" {
  ami = "ami-0568773882d492fc8"
  instance_type = "t2.micro"
  key_name = "SivaAnsibleKeyPair"

  tags = {
    Name = "Siva-server-IBM"
    env = "production"
    owner = "Siva"
  }
  provisioner "local-exec" {
    command = "echo The servers IP address is ${self.public_ip} && echo ${self.public_ip} > /tmp/inv"
  }
}

