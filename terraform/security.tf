resource "aws_security_group" "allow_access" {
  name        = "allow_access"
  description = "Allow All Access"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 0
    to_port     = 0 
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }


  lifecycle {
    ignore_changes = [
      ingress,
      egress,
    ]
  }

  tags         = {
    name = "kali sg"
  }
}

# resource "aws_security_group_rule" "example" {
#   type              = "ingress"
#   from_port         = 22
#   to_port           = 22
#   protocol          = "tcp"
#   cidr_blocks       = [aws_vpc.main.cidr_block, var.local_ip] 
#   security_group_id = aws_security_group.allow_access.id
# }
