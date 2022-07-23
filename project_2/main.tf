terraform {
    required_providers {
      local = {
        source = "hashicorp/local"
        version = "~> 2.2.3"
      }
    }
}

locals {
  var1 = "edzedze"
  var2 = 5
}


provider random {
    alias = "localing"
}

resource random_pet random-pet {
  length    = 1
  separator = ", "
  provider = random.localing

  lifecycle {
    postcondition {
      condition = self.separator == ", "
      error_message = "postcondition this element aren't true"
    }
  }
}

resource local_file random-file {
  filename             = "/root/${local.var1}"
  file_permission      = 0777
  content = random_pet.random-pet.id
}



