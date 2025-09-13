module "vpc" {
  source = "./Modules/VPC"
  # You would pass variables here
}

module "sg" {
  source = "./Modules/SecurityGroups"
  # You would pass variables here
  vpc_id = module.vpc.vpc_id
}

module "db" {
  source = "./Modules/db"
  # You would pass variables here
  private_sg_id = module.sg.private_sg_id
  private_subnet_ids = [module.vpc.private_subnet_1_id, module.vpc.private_subnet_2_id]
}

module "instance" {
  source = "./Modules/Instance"
  # You would pass variables here
  subnet_id = module.vpc.public_subnet_id
  sg_id     = module.sg.public_sg_id
  userdata  = module.db.userdata
}
#Create Security Groups


#Create EC2 Instance in Public Subnet
