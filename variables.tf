# Region variable

variable "aws_region" {
  type        = string
  default     = "us-east-1"
  description = "value for the AWS region"
}

# Database name variable

variable "db_name" {
  type        = string
  default     = "mydb"
  description = "value for the database name"
}

# Instance class variable

variable "instance_class" {
  type = string
}

# You can use this or locals

variable "inbound_ports" {
  type = list(number)
  default = [22, 80, 443]
  description = "value for the inbound ports"
}
  

# Declaring a list variable

# variable "sure_name" {
#     type = list(string)
#     default = ["Emma", "Esther", "Adufebaby"]
#     description = "value for the sure name"
# }

# Declaring a map variable

# variable "sure_map" {
#    type = map
#    default = {
#        "name": "Emma"
#        "surname": "Esther"
#        "nickname": "Adufebaby"
#        }
#    }