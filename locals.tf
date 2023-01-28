# local is another way of handling a value that does not change in file. It is like using variables, but variables changes and are mapped  globally. Local is used to define a value that does not change in a file.

locals {
  inbound_ports = var.inbound_ports
}

# aAnother method
# locals {
#     inbound_ports = [22, 80, 443]
# }