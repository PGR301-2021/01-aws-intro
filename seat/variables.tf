variable "instance_type" {
  type = string
  default = "t3.medium"
}

variable "ami" {
  type = string
}

variable "students" {
  type = list
}