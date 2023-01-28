resource "aws_security_group" "altschool_sg" {
  name        = "altschool_sg"
  description = "Allow TLS inbound traffic"

#  ingress {
#    description = "Inbound traffic for ssh"
#    from_port   = 22
#    to_port     = 22
#    protocol    = "tcp"
#    cidr_blocks = ["0.0.0.0/0"]
#  }

  # If you want to create ingress rules for multiple ports, you can use a for_each loop (dynamic blocks)
  dynamic "ingress" {
    for_each = local.inbound_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "altschool-SG"
  }
}
