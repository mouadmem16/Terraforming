terraform {
  backend "pg" {
    conn_str = "postgres://user:example@172.18.1.6/terra?sslmode=disable"
  }
}

variable "servers_number" {
  type        = number
  default     = 1
  description = "the number of servers in the cluster"
}


module "web_server" {
  source  = "./modules/aws_ec2"
  count   = var.servers_number
  appname = "webserver_${count.index}"
}

output "web_server" {
  value = {
    "private_ip" = module.web_server[*].private_ip
    "public_ip"  = module.web_server[*].public_ip
    "name"       = module.web_server[*].name
  }
}

