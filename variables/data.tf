data "aws_subnet" "selected" {                # we use data when we need to import selected resources from aws.
  filter {
    name   = "tag:Name"
    values = [var.subnet_name]                    # values are always in quotes but reference are never in quotes.
  }
}

data "aws_security_group" "selected" {
  id = var.security_group_id
}