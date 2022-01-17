resource "aws_instance" "mayur1" {
  ami                         = "ami-052cef05d01020f1d"
  subnet_id                   = data.aws_subnet.selected.id
  instance_type               = "t2.micro"
  key_name                    = "Key_Mumbai"
  security_groups             = [data.aws_security_group.selected.id]
  associate_public_ip_address = "true"


  tags = {
    Name = "Ansible Server|Terraform"
  }
}

resource "aws_instance" "mayur2" {
  ami                         = "ami-052cef05d01020f1d"
  subnet_id                   = data.aws_subnet.selected.id
  instance_type               = "t2.micro"
  key_name                    = "Key_Mumbai"
  security_groups             = [data.aws_security_group.selected.id]
  associate_public_ip_address = "true"


  tags = {
    Name = "Node 1|Terraform"
  }
}

resource "aws_instance" "mayur3" {
  ami                         = "ami-052cef05d01020f1d"
  subnet_id                   = data.aws_subnet.selected.id
  instance_type               = "t2.micro"
  key_name                    = "Key_Mumbai"
  security_groups             = [data.aws_security_group.selected.id]
  associate_public_ip_address = "true"


  tags = {
    Name = "Node 2|Terraform"
  }
}
