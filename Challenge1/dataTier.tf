module "subnet-rds-priv-1a" {
  source      = "./modules/subnet"
  vpc_id      = module.my_vpc.my_vpc_id
  cidr_subnet = var.cidr_subnet_5
  az_subnet   = var.az_subnet_5
  public      = var.public_5
  tags_subnet = var.tags_subnet_5
}

module "subnet-rds-priv-1b" {
  source      = "./modules/subnet"
  vpc_id      = module.my_vpc.my_vpc_id
  cidr_subnet = var.cidr_subnet_6
  az_subnet   = var.az_subnet_6
  public      = var.public_6
  tags_subnet = var.tags_subnet_6
}

# rt association
module "rt_ass_rds_priv_1a" {
  source         = "./modules/rt_association"
  subnet_id      = module.subnet-rds-priv-1a.subnet_id
  route_table_id = module.private_rt.rt_id
}
module "rt_ass_rds_priv_1b" {
  source         = "./modules/rt_association"
  subnet_id      = module.subnet-rds-priv-1b.subnet_id
  route_table_id = module.private_rt.rt_id
}

# security group for rds 
module "sg_rds" {
  source = "./modules/security_group"

  ingress_rules = [
    {
      description     = "allow on 3306"
      from_port       = 3306
      to_port         = 3306
      protocol        = "tcp"
      cidr_blocks     = null
      security_groups = [module.sg_app_server.sg_id]
    }

  ]
  vpc_id         = module.my_vpc.my_vpc_id
  sg_name        = "tf_sg_rds"
  sg_description = "SG for rds"
  egress_rules = [
    {
      description     = "allow"
      from_port       = 3306
      to_port         = 3306
      protocol        = "tcp"
      cidr_blocks     = null
      security_groups = [module.sg_app_server.sg_id]
    }
  ]
  #security_groups = var.security_groups_app_server
  tags_sg = {
    Name = "tf-db-sg"
  }
}

module db_subnet_group {
  source = "./modules/subnet_group"
  subnet_ids_subnet_group = [module.subnet-rds-priv-1a.subnet_id,module.subnet-rds-priv-1b.subnet_id]
  subnet_group_name = "tf-main"
  tags_subnet_group = {
  Name = "My tf-DB subnet group"
  }
}

# rds
module "db" {
  source            = "./modules/rds"
  identifier_name = "tf-db"
  allocated_storage = 10
  db_name           = "appdb"
  username = "applicationuser"
  vpc_security_group_ids = [module.sg_rds.sg_id]
  tags_rds = {
    Name = "tf-db"
  }
  subnet_group_name = module.db_subnet_group.subnet_group_id
}