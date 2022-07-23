/*
provider "aws" {
  version = "3.63.0"
}

data "aws_instance" "data_aws_instance" {
  instance_tags = {
    "Name" = "Terraform_test_Name"
  }

  depends_on = [
      aws_instance.test
  ]
}

output "output_aws_instance" {
  value = data.aws_instance.data_aws_instance
}

resource "aws_key_pair" "key_pair" {
  key_name   = "terraform_test_key"
  public_key = file("/root/.ssh/id_rsa.pub")
}

resource "aws_instance" "test" {
  ami           = "ami-0eb34a1ff6bafc83f"
  instance_type = "t2.micro"
  security_groups = [
    "launch-wizard-1"
  ]

  key_name = "terraform_test_key"

  tags = {
    Name = "Terraform_test_Name"
  }

  depends_on = [
    aws_key_pair.key_pair
  ]
}

*/