<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_SCP-L1-CTandOrgProtection"></a> [SCP-L1-CTandOrgProtection](#module\_SCP-L1-CTandOrgProtection) | gitlab.com/brv/shared/terraform/aws/terraform-aws-scp/modules/SC/ | n/a |
| <a name="module_SCP-L1-RootAccessRestriction"></a> [SCP-L1-RootAccessRestriction](#module\_SCP-L1-RootAccessRestriction) | gitlab.com/brv/shared/terraform/aws/terraform-aws-scp/modules/SC/ | n/a |
| <a name="module_SCP-L2-ApprovedServices"></a> [SCP-L2-ApprovedServices](#module\_SCP-L2-ApprovedServices) | gitlab.com/brv/shared/terraform/aws/terraform-aws-scp/modules/SC/ | n/a |
| <a name="module_SCP-L2-RegionRestriction"></a> [SCP-L2-RegionRestriction](#module\_SCP-L2-RegionRestriction) | gitlab.com/brv/shared/terraform/aws/terraform-aws-scp/modules/SC/ | n/a |
| <a name="module_attach_SCP-L1-CTandOrgProtection"></a> [attach\_SCP-L1-CTandOrgProtection](#module\_attach\_SCP-L1-CTandOrgProtection) | gitlab.com/brv/shared/terraform/aws/terraform-aws-scp/modules/OPA/ | n/a |
| <a name="module_attach_SCP-L1-RootAccessRestriction"></a> [attach\_SCP-L1-RootAccessRestriction](#module\_attach\_SCP-L1-RootAccessRestriction) | gitlab.com/brv/shared/terraform/aws/terraform-aws-scp/modules/OPA/ | n/a |
| <a name="module_attach_SCP-L2-ApprovedServices"></a> [attach\_SCP-L2-ApprovedServices](#module\_attach\_SCP-L2-ApprovedServices) | gitlab.com/brv/shared/terraform/aws/terraform-aws-scp/modules/OPA/ | n/a |
| <a name="module_attach_SCP-L2-RegionRestriction"></a> [attach\_SCP-L2-RegionRestriction](#module\_attach\_SCP-L2-RegionRestriction) | gitlab.com/brv/shared/terraform/aws/terraform-aws-scp/modules/OPA/ | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_target_id"></a> [target\_id](#input\_target\_id) | Target OU or Account extract from varibale file. | `any` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->