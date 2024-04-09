resource "aws_instance" "manager" {
  ami                         = var.instance_ami
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.ec2-key.key_name
  availability_zone           = "${var.availability_zone}a"
  associate_public_ip_address = true
  subnet_id                   = aws_subnet.subnet_manager.id
  security_groups             = [aws_security_group.docker-ec2-swarm-sg.id]

  ### Install Docker
  user_data = <<-EOF
    #!/bin/bash
    yum update -y
    sudo amazon-linux-extras install docker
    sudo service docker start
    sudo usermod -a -G docker ec2-user
    #Make docker auto-start
    sudo chkconfig docker on
    sudo curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
    sudo reboot
  EOF

  tags = {
    Name = "Manager Instance"
  }
}