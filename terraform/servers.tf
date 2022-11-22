//servers.tf
resource "aws_instance" "kali" {
  ami = var.ami_id
  instance_type = var.instance
  key_name = var.key_pair
  security_groups = [aws_security_group.allow_access.id]
  subnet_id = aws_subnet.main.id
  user_data = var.data_path

  tags = {
    Name = var.ami_name
  }
}
