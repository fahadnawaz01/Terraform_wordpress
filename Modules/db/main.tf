


resource "aws_db_subnet_group" "private_db_subnet_group" {
  name       = "private_db_subnet_group"
  subnet_ids = var.private_subnet_ids

  tags = {
    Name = "My DB subnet group"
  }
}

resource "aws_db_instance" "web_db" {
  allocated_storage      = 10
  db_name                = var.db_name
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = var.db_instance_class
  username               = var.db_username
  password               = var.db_password
  parameter_group_name   = "default.mysql8.0"
  skip_final_snapshot    = true
  db_subnet_group_name   = aws_db_subnet_group.private_db_subnet_group.name
  vpc_security_group_ids = [var.private_sg_id]

  tags = {
    Name = "My DB instance"
  }
}


data "template_file" "web_instance_userdata" {
  template = file("${path.root}/userdata.tpl")

  vars = {
    db_host = aws_db_instance.web_db.endpoint
    db_user = aws_db_instance.web_db.username
    db_pass = aws_db_instance.web_db.password
    db_name = aws_db_instance.web_db.db_name
  }
}
