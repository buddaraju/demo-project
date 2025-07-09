// ec2 instance start
provider "aws" {
  region = "us-east-1"
}
resource "aws_instance" "instance" {
  ami           = "ami-020cba7c55df1f615"
  instance_type = "t2.micro"
  key_name      = "Terraformkey"
  /*security_groups = ["terraform-sg"]*/
  vpc_security_group_ids = [aws_security_group.terraform-sg.id]
  subnet_id              = aws_subnet.dpw-public_subent_01.id
  // for_each start
  for_each = toset(["jenkins-master", "jenkins-slave", "Ansible"])
  tags = {
    Name = "${each.key}"
  }
  // for_each end
}
// ec2 instance end

// Security group start
resource "aws_security_group" "terraform-sg" {
  name        = "terraform-sg"
  description = "terraform security group"
  vpc_id      = aws_vpc.dpw-vpc.id

  ingress {
    description = "ssh access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "jenkins access"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "terraform-security-group"
  }
}
// Security group end

// VPC start
resource "aws_vpc" "dpw-vpc" {
  cidr_block = "10.1.0.0/16"
  tags = {
    Name = "dpw-vpc"
  }
}
// VPC end

// Subnet start
resource "aws_subnet" "dpw-public_subent_01" {
  vpc_id                  = aws_vpc.dpw-vpc.id
  cidr_block              = "10.1.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-1a"
  tags = {
    Name = "dpw-public_subent_01"
  }
}
// Subnet end

// Internet Gateway  start
resource "aws_internet_gateway" "dpw-igw" {
  vpc_id = aws_vpc.dpw-vpc.id
  tags = {
    Name = "dpw-igw"
  }
}
// Internet Gateway  end

//route table start
resource "aws_route_table" "dpw-public-rt" {
  vpc_id = aws_vpc.dpw-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.dpw-igw.id
  }
  tags = {
    Name = "dpw-public-rt"
  }
}
// route table end

// Associate subnet with route table start
resource "aws_route_table_association" "dpw-rta-public-subent-1" {
  subnet_id      = aws_subnet.dpw-public_subent_01.id
  route_table_id = aws_route_table.dpw-public-rt.id
}
// Associate subnet with route table end
