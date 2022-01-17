provider "aws" {
  region     = "ap-south-1"
}


#VPC Module
resource "aws_vpc" "mayur" {
  cidr_block       = "20.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "VPC|Terraform"
  }
}


#Subnet Module
resource "aws_subnet" "mayur1" {
  vpc_id     = aws_vpc.mayur.id
  cidr_block = "20.0.0.0/24"
  availability_zone = "ap-south-1a"
  

  tags = {
    Name = "Public Subnet 1|Terraform"
  }
}

resource "aws_subnet" "mayur2" {
  vpc_id     = aws_vpc.mayur.id
  cidr_block = "20.0.1.0/24"
  availability_zone = "ap-south-1a"
  

  tags = {
    Name = "Public Subnet 2|Terraform"
  }
}

#Internet Gateway module
resource "aws_internet_gateway" "mayur" {
  vpc_id = aws_vpc.mayur.id

  tags = {
    Name = "IG|Terraform"
  }
}


#Route Table Module
resource "aws_route_table" "mayur" {
  vpc_id = aws_vpc.mayur.id

  #route = []

  tags = {
    Name = "RT|Terraform"
  }
}


#Route Module: Association between Route Table and Internet Gateway
resource "aws_route" "mayur" {
  route_table_id         = aws_route_table.mayur.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.mayur.id         
  #depends_on             = [aws_route_table.mayur]
}


#Route Table Association: Association between Route Table and Subnet
resource "aws_route_table_association" "mayur_subnet1" {
  subnet_id      = aws_subnet.mayur1.id
  route_table_id = aws_route_table.mayur.id
}

resource "aws_route_table_association" "mayur_subnet2" {
  subnet_id      = aws_subnet.mayur2.id
  route_table_id = aws_route_table.mayur.id
}


#Security Group Module
resource "aws_security_group" "mayur" {
  name        = "Allow_selected_traffic"
  description = "Allow only ssh,rdp,http & https"
  vpc_id      = aws_vpc.mayur.id

  ingress {
    description      = "ssh"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = null
  }

  ingress {
    description      = "http"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = null
  }

  ingress {
    description      = "https"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = null
  }

  ingress {
    description      = "rdp"
    from_port        = 3389
    to_port          = 3389
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = null
  }

  egress {
    from_port        = 0    #all port
    to_port          = 0    #all port
    protocol         = "-1" #all traffic
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = null
  }

  tags = {
    Name = "SG|Terraform"
  }
}


# EC2 instance
resource "aws_instance" "mayur1" {
  ami           = "ami-0a7b049697326f626"
  subnet_id     = aws_subnet.mayur1.id
  instance_type = "t2.micro"
  key_name      = "Key_Mumbai"
  vpc_security_group_ids = [aws_security_group.mayur.id]
  associate_public_ip_address = "true"


  tags = {
    Name = "Windows|Terraform"
  }
}

resource "aws_instance" "mayur2" {
  ami           = "ami-052cef05d01020f1d"
  subnet_id     = aws_subnet.mayur2.id
  instance_type = "t2.micro"
  key_name      = "Key_Mumbai"
  vpc_security_group_ids = [aws_security_group.mayur.id]
  associate_public_ip_address = "true"


  tags = {
    Name = "Linux|Terraform"
  }
}