variable appname {
  type        = string
  description = "the name of the application"
}

variable machine {
    type      = object({
        image_id             = string
        availability_zone    = string
        instance_type        = string
    })

    default = {
        image_id               = "ami-0cff7528ff583bf9a"
        availability_zone      = "us-east-1d"
        instance_type          = "t2.micro"
    }

    validation {
        condition = substr(var.machine.image_id, 0, 3) == "ami"
        error_message = "you have to provide a valid ami"
    }

    description = "the parameters of the machine"
}


variable interface {
    type      = object({
        security_groups             = list(string)
    })

    default = {
        security_groups             = [
            "sg-011464d9a9103a6fa"
        ]
    }

    description = "the parameters of the interface"
}

variable subnet {
    type      = object({
        availability_zone             = string
        cidr_block                    = string
        vpc_id                        = string
    })

    default = {
        availability_zone             = "us-east-1d"
        cidr_block                    = "172.31.1.0/24"
        vpc_id                        = "vpc-9fff4be2"
    }

    description = "the parameters of the interface"
}