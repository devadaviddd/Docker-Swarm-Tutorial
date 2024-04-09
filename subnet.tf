resource "aws_subnet" "subnet_manager" {
  cidr_block        = cidrsubnet(aws_vpc.main.cidr_block, 4, 0)
  vpc_id            = aws_vpc.main.id
  availability_zone = "${var.availability_zone}a"
}

resource "aws_subnet" "subnet_worker" {
  cidr_block        = cidrsubnet(aws_vpc.main.cidr_block, 4, 1)
  vpc_id            = aws_vpc.main.id
  availability_zone = "${var.availability_zone}b"
}

resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.swarm-igw.id
  }
  tags = {
    Name = "EC2 + Docker Route Table"
  }
}

resource "aws_route_table_association" "public_subnet_manager" {
  subnet_id      = aws_subnet.subnet_manager.id
  route_table_id = aws_route_table.route_table.id
}

resource "aws_route_table_association" "public_subnet_worker" {
  subnet_id      = aws_subnet.subnet_worker.id
  route_table_id = aws_route_table.route_table.id
}