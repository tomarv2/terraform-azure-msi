<p align="center">
    <a href="https://www.apache.org/licenses/LICENSE-2.0" alt="license">
        <img src="https://img.shields.io/github/license/tomarv2/terraform-azure-msi" /></a>
    <a href="https://github.com/tomarv2/terraform-azure-msi/tags" alt="GitHub tag">
        <img src="https://img.shields.io/github/v/tag/tomarv2/terraform-azure-msi" /></a>
    <a href="https://github.com/tomarv2/terraform-azure-msi/pulse" alt="Activity">
        <img src="https://img.shields.io/github/commit-activity/m/tomarv2/terraform-azure-msi" /></a>
    <a href="https://stackoverflow.com/users/6679867/tomarv2" alt="Stack Exchange reputation">
        <img src="https://img.shields.io/stackexchange/stackoverflow/r/6679867" /></a>
    <a href="https://discord.gg/XH975bzN">
        <img src="https://img.shields.io/discord/813961944443912223?logo=discord"
            alt="chat on Discord"></a>
    <a href="https://twitter.com/intent/follow?screen_name=varuntomar2019">
        <img src="https://img.shields.io/twitter/follow/varuntomar2019?style=social&logo=twitter"
            alt="follow on Twitter"></a>
</p>

# Azure Managed Service Identity

## Versions

- Module tested for Terraform 0.14.
- Azure provider version [2.48.0](https://registry.terraform.io/providers/hashicorp/azurerm/latest)
- `main` branch: Provider versions not pinned to keep up with Terraform releases
- `tags` releases: Tags are pinned with versions (use latest     
        <a href="https://github.com/tomarv2/terraform-azure-msi/tags" alt="GitHub tag">
        <img src="https://img.shields.io/github/v/tag/tomarv2/terraform-azure-msi" /></a>
  in your releases)

**NOTE:** 

- Read more on [tfremote](https://github.com/tomarv2/tfremote)

## Usage

Recommended method:

- Create python 3.6+ virtual environment 
```
python3 -m venv <venv name>
```

- Install package:
```
pip install tfremote
```

- Set below environment variables:
```
export TF_AZURE_STORAGE_ACCOUNT=tfstatexxxxx # Output of remote_state.sh
export TF_AZURE_CONTAINER=tfstate # Output of remote_state.sh
export ARM_ACCESS_KEY=xxxxxxxxxx # Output of remote_state.sh
```  

- Update `examples/main.tf`

- Run and verify the output before deploying:
```
tf -cloud azure plan -var-file <path to .tfvars file> -var "subscription_id=<>" \
-var "client_id=<>" -var "client_secret=<>" -var "tenant_id=<>"
```

- Run below to deploy:
```
tf -cloud azure apply -var-file <path to .tfvars file> -var "subscription_id=<>" \
-var "client_id=<>" -var "client_secret=<>" -var "tenant_id=<>"
```

- Run below to destroy:
```
tf -cloud azure destroy -var-file <path to .tfvars file> -var "subscription_id=<>" \
-var "client_id=<>" -var "client_secret=<>" -var "tenant_id=<>"
```

> ❗️ **Important** - Two variables are required for using `tf` package:
>
> - teamid
> - prjid
>
> These variables are required to set backend path in the remote storage.
> Variables can be defined using:
>
> - As `inline variables` e.g.: `-var='teamid=demo-team' -var='prjid=demo-project'`
> - Inside `.tfvars` file e.g.: `-var-file=<tfvars file location> `
>
> For more information refer to [Terraform documentation](https://www.terraform.io/docs/language/values/variables.html)


```
module "msi" {
  source = "../"

  add_msi         = true
  rg_name         = "demo-rg"
  email           = 'demo@demo.com'
  client_id       = var.client_id
  client_secret   = var.client_secret
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
  # ---------------------------------------------
  # Note: Do not change teamid and prjid once set.
  teamid = var.teamid
  prjid  = var.prjid
}
```

Please refer to examples directory [link](examples) for references.

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.14 |
| azurerm | ~> 2.48 |

## Providers

| Name | Version |
|------|---------|
| azurerm | ~> 2.48 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| add\_msi | Do you want to add MSI(Note: this is a feature flag) | `bool` | `false` | no |
| client\_id | n/a | `any` | n/a | yes |
| client\_secret | n/a | `any` | n/a | yes |
| email | email address to be used for tagging (suggestion: use group email address) | `any` | n/a | yes |
| msi\_depends\_on | n/a | `any` | `null` | no |
| msi\_location | n/a | `string` | `"eastus"` | no |
| prjid | (Required) Name of the project/stack e.g: mystack, nifieks, demoaci. Should not be changed after running 'tf apply' | `any` | n/a | yes |
| rg\_name | n/a | `any` | n/a | yes |
| subscription\_id | n/a | `any` | n/a | yes |
| teamid | (Required) Name of the team/group e.g. devops, dataengineering. Should not be changed after running 'tf apply' | `any` | n/a | yes |
| tenant\_id | n/a | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| msi\_id | The ID of the MSI created. |
| msi\_name | n/a |
| msi\_principal\_id | The ID of the Principal (User, Group or Service Principal) to assign the Role Definition to. |
