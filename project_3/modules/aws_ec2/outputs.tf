output "private_ip" {
  value       = aws_instance.machine.private_ip
  description = "The private IP address of the main server instance."
}

output "public_ip" {
  value       = aws_instance.machine.public_ip
  description = "The public IP address of the main server instance."
}

output "name" {
  value       = "${title(var.appname)}_machine"
  description = "The name of the main server instance."
}
