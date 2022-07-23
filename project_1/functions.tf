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