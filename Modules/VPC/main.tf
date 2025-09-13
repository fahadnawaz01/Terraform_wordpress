resource "aws_vpc" "web_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "web_vpc"
  }
}


resource "aws_subnet" "public_subnet_1" {
  vpc_id                  = aws_vpc.web_vpc.id
  cidr_block              = var.public_subnet_cidr
  availability_zone       = var.public_az
  map_public_ip_on_launch = true

  tags = {
    Name = "public_subnet_1"
  }
}

resource "aws_subnet" "private_subnet_1" {
  vpc_id            = aws_vpc.web_vpc.id
  cidr_block        = var.private_subnet_1_cidr
  availability_zone = var.private_az_1
  tags = {
    Name = "private_subnet_1"
  }
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id            = aws_vpc.web_vpc.id
  cidr_block        = var.private_subnet_2_cidr
  availability_zone = var.private_az_2
  tags = {
    Name = "private_subnet_1"
  }
}


#Create Internet Gateway and public route table
resource "aws_internet_gateway" "web_igw" {
  vpc_id = aws_vpc.web_vpc.id

  tags = {
    Name = "web_igw"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.web_vpc.id


  tags = {
    Name = "public_rt"
  }
}

resource "aws_route" "web_route" {
  route_table_id         = aws_route_table.public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.web_igw.id
}

resource "aws_route_table_association" "public_rt_assoc" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.public_rt.id
}

# Elastic ip for NAT gateway and private route table along with association
# resource "aws_eip" "nat_eip" {
#   domain = "vpc"

#   tags = {
#     Name = "nat_eip"
#   }
# }

# resource "aws_nat_gateway" "nat_gw" {
#   allocation_id = aws_eip.nat_eip.id
#   subnet_id     = aws_subnet.private_subnet_1.id

#    tags = {
#     Name = "gw NAT"
#   }

#   depends_on = [aws_internet_gateway.web_igw]
# }


resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.web_vpc.id

  tags = {
    Name = "private_rt"
  }
}

# resource "aws_route" "nat_route" {
#   route_table_id            = aws_route_table.private_rt.id
#   destination_cidr_block    = "0.0.0.0/0"
#   gateway_id                = aws_nat_gateway.nat_gw.id
# }

resource "aws_route_table_association" "private_subnet_rt_assoc" {
  subnet_id      = aws_subnet.private_subnet_1.id
  route_table_id = aws_route_table.private_rt.id
}