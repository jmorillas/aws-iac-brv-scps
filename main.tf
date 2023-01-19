##################################################################
# 888888b.                                                      ##
# 888  "88b                                                     ##
# 888  .88P                                                     ##
# 8888888K.  888d888 8888b.  888  888 888  888 888d888 8888b.   ##
# 888  "Y88b 888P"      "88b 888  888 888  888 888P"      "88b  ##
# 888    888 888    .d888888 Y88  88P 888  888 888    .d888888  ##
# 888   d88P 888    888  888  Y8bd8P  Y88b 888 888    888  888  ##
# 8888888P"  888    "Y888888   Y88P    "Y88888 888    "Y888888  ##
##################################################################

#              8888888           .d8888b.                       ##
#                888            d88P  Y88b                      ##
#                888            888    888                      ##
#                888    8888b.  888                             ##
#                888       "88b 888                             ##
#                888   .d888888 888    888                      ##
#                888   888  888 Y88b  d88P                      ##
#              8888888 "Y888888  "Y8888P"                       ##
##################################################################
##      Code INDEX (Please update required)                   ####
# 1. Set Terraform Backend configuration                      ####
# 2. Set Terraform Provider                                   ####
# 3. AWS Organization SCPs Creation (Data imported remotely)  ####
# 4. AWS Organization SCPs Attachment                         ####
#                                                             ####
##################################################################

##################################################
# Set terraform backend remotely                ##
##################################################

# terraform {
#   backend "s3" {
#     key    = "Bucket/key" # Terraform state stored remotely
#     region = "ap-southeast-2"
#   }
# }

##################################################
# Set terraform provider                        ##
##################################################

provider "aws" {
  region = "ap-southeast-2"
}


############################
###  AWS SCPs Creation    ##
###       MODULE          ##
############################


module "SCP-L2-RegionRestriction" {
  source = "github.com/jmorillas/scps/modules/SC/"
  scp_name      = "SCP-L2-RegionRestriction"
}
module "SCP-L2-ApprovedServices" {
  source = "github.com/jmorillas/scps/modules/SC/"
  scp_name      = "SCP-L2-ApprovedServices"
}
module "SCP-L1-RootAccessRestriction" {
  source = "github.com/jmorillas/scps/modules/SC/"
  scp_name      = "SCP-L1-RootAccessRestriction"
}
module "SCP-L1-CTandOrgProtection" {
  source = "github.com/jmorillas/scps/modules/SC/"
  scp_name      = "SCP-L1-CTandOrgProtection"
}


############################
###  AWS SCPs Attachment  ##
###       MODULE          ##
############################


module "attach_SCP-L2-RegionRestriction"{
  source = "github.com/jmorillas/scps/modules/OPA/"
  policy_id = module.SCP-L2-RegionRestriction.aws_organizations_policy-id
  target_id = var.target_id
}
module "attach_SCP-L2-ApprovedServices"{
  source = "github.com/jmorillas/scps/modules/OPA/"
  policy_id = module.SCP-L2-ApprovedServices.aws_organizations_policy-id
  target_id = var.target_id
}
module "attach_SCP-L1-RootAccessRestriction"{
  source = "github.com/jmorillas/scps/modules/OPA/"
  policy_id = module.SCP-L1-RootAccessRestriction.aws_organizations_policy-id
  target_id = var.target_id
}
module "attach_SCP-L1-CTandOrgProtection"{
  source = "github.com/jmorillas/scps/modules/OPA/"
  policy_id = module.SCP-L1-CTandOrgProtection.aws_organizations_policy-id
  target_id = var.target_id
}








