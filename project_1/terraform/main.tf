provider "aws" {
  version = "3.63.0"
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
    "aws_key_pair.key_pair"
  ]
}

/*locals {
  var_name = can("/root/terraform/filename.txt")
}

variable "var_name" {
  type = string
  description = "i dont have a description"
  default = "some default value"

  validation {
    condition     = length(var.var_name) > 3
    error_message = "The var_name value must be a valid AMI id, starting with \"ami-\"."
  }
}

resource "local_file" "filename" {
  filename = try(local.var_name, "/root/terraform/file.txt")
  content = "${var.var_name}"
}
*/