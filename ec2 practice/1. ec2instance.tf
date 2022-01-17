# The default provider configuration; resources that begin with `aws` will use
# it as the default, and it can be referenced as `aws`.


provider "aws" {
  region     = "ap-south-1"
}

resource "aws_instance" "LinuxInstance" {
  ami           = "ami-052cef05d01020f1d"
  instance_type = "t2.micro"

  tags = {
    Name = "Linux"
  }
}

# aws_instance.LinuxInstance ---------> This statement refers to above resource block.
# To destroy a specific we use -------> terraform destroy -target aws_instance.LinuxInstance
