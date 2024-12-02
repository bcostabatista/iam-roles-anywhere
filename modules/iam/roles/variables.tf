variable "role" {
  description = "The name of the IAM Role to be created."
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to the role."
  type        = map(string)
  default     = {}
}