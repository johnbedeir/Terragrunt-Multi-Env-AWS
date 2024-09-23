resource "aws_instance" "ec2" {
  ami           = var.ec2ami
  instance_type = var.ec2type
  subnet_id     = aws_subnet.subnet.id

  tags = {
    Name = var.ec2name
  }
}