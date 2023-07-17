#Project region
variable "region" {
  type = string
}
############################
#vpc
variable "tags_vpc" {
  type = map(any)
}

variable "cidr_vpc" {
  type = string
}

#############################
#subnet-1-public-ap-south-1a

variable "cidr_subnet_1" {
  type = string
}

variable "az_subnet_1" {
  type = string
}

variable "tags_subnet_1" {
  type = map(any)
}

variable "public_1" {
  type = bool
}

#############################
#subnet-2-public-ap-south-1b

variable "cidr_subnet_2" {
  type = string
}

variable "az_subnet_2" {
  type = string
}

variable "tags_subnet_2" {
  type = map(any)
}

variable "public_2" {
  type = bool
}

#############################
#subnet-1-private-ap-south-1a

variable "cidr_subnet_3" {
  type = string
}

variable "az_subnet_3" {
  type = string
}

variable "tags_subnet_3" {
  type = map(any)
}

variable "public_3" {
  type = bool
}

#############################
#subnet-2-private-ap-south-1b

variable "cidr_subnet_4" {
  type = string
}

variable "az_subnet_4" {
  type = string
}

variable "tags_subnet_4" {
  type = map(any)
}

variable "public_4" {
  type = bool
}


#############################
#subnet-5-rds-private-ap-south-1a

variable "cidr_subnet_5" {
  type = string
}

variable "az_subnet_5" {
  type = string
}

variable "tags_subnet_5" {
  type = map(any)
}

variable "public_5" {
  type = bool
}

#############################
#subnet-6-rds-private-ap-south-1a

variable "cidr_subnet_6" {
  type = string
}

variable "az_subnet_6" {
  type = string
}

variable "tags_subnet_6" {
  type = map(any)
}

variable "public_6" {
  type = bool
}

#############################
#igw

variable "tags_igw" {
  type = map(any)
}

##############################
#route_table

variable "rt_tags_pub" {
  type = map(any)
}
variable "rt_cidr_block_pub" {
  type = string
}

#route_table
variable "rt_tags_priv" {
  type = map(any)
}
variable "rt_cidr_block_priv" {
  type = string
}
##############################
#eip
variable "tags_eip" {
  type = map(any)
}
##############################
#nat
variable "tags_nat" {
  type = map(any)
}
##############################
#sg_alb_web

variable "ingress_rules_web" {
  type = list(any)
}
variable "sg_name_web" {
  type = string
}
variable "egress_rules_web" {
  type = list(any)
}
variable "sg_description_web" {
  type = string
}
# variable "security_groups_web" {
#   type = list(any)
# }
variable "tags_sg_web" {
  type = map(any)
}
##############################
#sg_alb_app
variable "ingress_rules_app" {
  type = list(any)

}
variable "sg_name_app" {
  type = string
}
variable "egress_rules_app" {
  type = list(any)
}
variable "sg_description_app" {
  type = string
}
# variable "security_groups_app" {
#   type = list(any)
# }
variable "tags_sg_app" {
  type = map(any)
}
##############################
#sg_web_server

variable "sg_name_web_server" {
  type = string
}
variable "egress_rules_web_server" {
  type = list(any)
}
variable "sg_description_web_server" {
  type = string
}
variable "tags_sg_web_server" {
  type = map(any)
}
##############################
#sg_app_server

variable "sg_name_app_server" {
  type = string
}
variable "egress_rules_app_server" {
  type = list(any)
}
variable "sg_description_app_server" {
  type = string
}
variable "tags_sg_app_server" {
  type = map(any)
}
##############################
#web alb
variable "alb_webtier_name" {
  type = any
}
variable "tags_alb_web" {
  type = map(any)
}

#app alb
variable "alb_apptier_name" {
  type = any
}
variable "tags_alb_app" {
  type = map(any)
}

##############################
#target group
variable "tg_apptier_name" {
  type = any
}
variable "tags_app_tg" {
  type = map(any)
}
variable "tg_webtier_name" {
  type = any
}
variable "tags_web_tg" {
  type = map(any)
}

##############################
# Launch Template

# Web Tier 
variable "ami_web_id" {
  type = any
}
variable "instance_web_type" {
  type = any
}
variable "key_web_name" {
  type = any
}

# App Tier
variable "ami_app_id" {
  type = any
}
variable "instance_app_type" {
  type = any
}
variable "key_app_name" {
  type = any
}