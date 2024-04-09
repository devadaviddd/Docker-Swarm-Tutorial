resource "aws_security_group" "docker-ec2-swarm-sg" {
  name   = "Docker ec2 Swarm Security Group"
  vpc_id = aws_vpc.main.id

  ingress {
    cidr_blocks = [
      "0.0.0.0/0"
    ]
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
  }

  ingress {
    cidr_blocks = [
      "0.0.0.0/0"
    ]
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
  }

  # Port 2377 TCP for communication with and between manager nodes
  ingress {
    cidr_blocks = [
      "0.0.0.0/0"
    ]
    from_port = 2377
    to_port   = 2377
    protocol  = "tcp"
  }

  # Port 7946 TCP/UDP for overlay network node discovery
  ingress {
    cidr_blocks = [
      "0.0.0.0/0"
    ]
    from_port = 7946
    to_port   = 7946
    protocol  = "tcp"
  }

  # Port 4789 UDP (configurable) for overlay network traffic
  ingress {
    cidr_blocks = [
      "0.0.0.0/0"
    ]
    from_port = 4789
    to_port   = 4789
    protocol  = "UDP"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}