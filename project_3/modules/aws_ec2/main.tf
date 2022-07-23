terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.22.0"
    }
  }
}

resource "aws_instance" "machine" {
    ami                                  = var.machine.image_id
    availability_zone                    = var.machine.availability_zone
    instance_type                        = var.machine.instance_type

    tags                                 = {
        "Name" = "${title(var.appname)}_machine"
    }

   # key_name                             = aws_key_pair.key.key_name

    root_block_device {
        delete_on_termination = true
        volume_size           = 8
        volume_type           = "gp2"
    }

    network_interface {
        device_index          = 0
        network_interface_id  = aws_network_interface.interface.id
    }
}

# resource "aws_key_pair" "key" {
#   key_name   = "key_machine"
#   public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCtj/FwmNvyekKWqlSeI1/YVTThoJfk0bcD9rruhaAN/cmDnxoiuDzK5Kq83/Ac+f6LMWtn38J3SkkqPl9VA7yzsJKK3mC3mPc/NPCyUcYMd6NecWlhOXfg2o7X1q75cHrH7xaXFJ//mmpvzfJotsmDA/+DODSWF15fXIf1ygkJW28WCZ7hnTKbhYVFcpNmNSFRXIyBhvNykbCuRbPNnaL/OdsRTMEGGMG5K0bNuNZrdTetU/mbj9VRVimAJCSS1mhlVzlpCi++gDRGYXCn1zfqmHf1tsqynwKGO27Mp5SneyGMNGGDYgJGeDSXlJ9Ve0hZWsVmSqR0KFOurE02nfZX/u3073GVRHzHGxN1G641ld/EbwgT3ow2abdyL8wG0vwoJRVtRKvIWrEBS8fbuGJXqidZEZJIQgpBSop+83QUWTRceL8CYQLNKeZXQ7ebvcTe6xQFSZMKqokxhoXl6ozFq70aZDJISxXRpw9GWAxyL07AyE3chtCi72y1pBVK9ucz54iOyzPjsYM3rKmoXs68NsjxphtnWmWv9wURCr7nxYIJv5iJT7Opa3f85s6c8rQwYIXvjK0AvGa5jRpTJAUsOiRlS4PYzGDEzbrv2jtN8Ry1WFZxna+15p/BHHH53zfVgg8Wx+Lz7W9kw8Gdoky5+ElX+Duq9NjTwvSh6OsFTQ== dell@DESKTOP-NHV04AU"

#   lifecycle {
#     prevent_destroy = true
#   }
# }

resource "aws_network_interface" "interface" {
    subnet_id          = aws_subnet.subnet.id
    security_groups    = var.interface.security_groups
    tags               = {
        "Name" = "${title(var.appname)}_interface"
    }
}

resource "aws_subnet" "subnet" {
    availability_zone                              = var.subnet.availability_zone
    cidr_block                                     = var.subnet.cidr_block
    tags                                           = {
        "Name" = "${title(var.appname)}_subnet"
    }
    vpc_id                                         = var.subnet.vpc_id
    map_public_ip_on_launch                        = "true"
}