[![](https://img.shields.io/badge/license-Apache%202-blue.svg)](https://www.apache.org/licenses/LICENSE-2.0)
![GitHub tag (latest by date)](https://img.shields.io/github/v/tag/tomarv2/terraform-azure-msi?style=plastic)
![Stack Exchange reputation](https://img.shields.io/stackexchange/stackoverflow/r/6679867)
![Twitter Follow](https://img.shields.io/twitter/follow/varuntomar2019?label=tomarv2&style=social)
![Discord](https://img.shields.io/discord/813961944443912223)

# Azure Managed Service Identity

## Versions

- Module tested for Terraform 0.14.
- Azure provider version [2.48.0](https://registry.terraform.io/providers/hashicorp/azurerm/latest)
- `main` branch: Provider versions not pinned to keep up with Terraform releases
- `tags` releases: Tags are pinned with versions (use latest tag in your releases)

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

- Update:
```
example/custom/sample.tfvars
```

- Change to: 
```
example/base
``` 

- Run and verify the output before deploying:
```
tf -cloud aws plan -var-file <path to .tfvars file> -var "subscription_id=<>" \
-var "client_id=<>" -var "client_secret=<>" -var "tenant_id=<>"
```

- Run below to deploy:
```
tf -cloud aws apply -var-file <path to .tfvars file> -var "subscription_id=<>" \
-var "client_id=<>" -var "client_secret=<>" -var "tenant_id=<>"
```

- Run below to destroy:
```
tf -cloud aws destroy -var-file <path to .tfvars file> -var "subscription_id=<>" \
-var "client_id=<>" -var "client_secret=<>" -var "tenant_id=<>"
```

Please refer to example directory [link](example/README.md) for references.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| add\_msi | n/a | `bool` | `false` | no |
| client\_id | n/a | `any` | n/a | yes |
| client\_secret | n/a | `any` | n/a | yes |
| email | Email address to be used to for tagging | `any` | n/a | yes |
| msi\_depends\_on | n/a | `any` | `null` | no |
| prjid | Name of the project/stack e.g: mystack, nifieks. Should not be changed after running 'tf apply'. | `any` | n/a | yes |
| rg\_name | n/a | `any` | n/a | yes |
| subscription\_id | n/a | `any` | n/a | yes |
| teamid | Name of the team or group e.g. devops, dataengineering. Should not be changed after running 'tf apply'. | `any` | n/a | yes |
| tenant\_id | n/a | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| msi\_id | The ID of the MSI created. |
