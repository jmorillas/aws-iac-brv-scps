
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
  source = "gitlab.com/brv/shared/terraform/aws/terraform-aws-scp/modules/SC/"
  scp_name      = "SCP-L2-RegionRestriction"
}
module "SCP-L2-ApprovedServices" {
  source = "gitlab.com/brv/shared/terraform/aws/terraform-aws-scp/modules/SC/"
  scp_name      = "SCP-L2-ApprovedServices"
}
module "SCP-L1-RootAccessRestriction" {
  source = "gitlab.com/brv/shared/terraform/aws/terraform-aws-scp/modules/SC/"
  scp_name      = "SCP-L1-RootAccessRestriction"
}
module "SCP-L1-CTandOrgProtection" {
  source = "gitlab.com/brv/shared/terraform/aws/terraform-aws-scp/modules/SC/"
  scp_name      = "SCP-L1-CTandOrgProtection"
}


############################
###  AWS SCPs Attachment  ##
###       MODULE          ##
############################


module "attach_SCP-L2-RegionRestriction"{
  source = "gitlab.com/brv/shared/terraform/aws/terraform-aws-scp/modules/OPA/"
  policy_id = module.SCP-L2-RegionRestriction.aws_organizations_policy-id
  target_id = var.target_id
}
module "attach_SCP-L2-ApprovedServices"{
  source = "gitlab.com/brv/shared/terraform/aws/terraform-aws-scp/modules/OPA/"
  policy_id = module.SCP-L2-ApprovedServices.aws_organizations_policy-id
  target_id = var.target_id
}
module "attach_SCP-L1-RootAccessRestriction"{
  source = "gitlab.com/brv/shared/terraform/aws/terraform-aws-scp/modules/OPA/"
  policy_id = module.SCP-L1-RootAccessRestriction.aws_organizations_policy-id
  target_id = var.target_id
}
module "attach_SCP-L1-CTandOrgProtection"{
  source = "gitlab.com/brv/shared/terraform/aws/terraform-aws-scp/modules/OPA/"
  policy_id = module.SCP-L1-CTandOrgProtection.aws_organizations_policy-id
  target_id = var.target_id
}








