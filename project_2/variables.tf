variable pet_length {
  type        = number
  default     = "6"
  description = "pet length"

  validation {
    condition = var.pet_length > 3 && var.pet_length < 27
    error_message = "this value must be between 3 and 27"
  }
}
