resource "aws_instance" "web_instance" {
  ami                    = data.aws_ami.data_ami.id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.sg_id]
  key_name               = var.key_name
  user_data              = var.userdata

  tags = {
    Name = "web_instance"
  }
}