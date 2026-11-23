# stw-tf-nat-gateway

Terraform module that generates an Azure NAT Gateway and associates it with a public IP and a subnet.

## Usage

```hcl
module "nat_gateway" {
  source = "git::https://github.com/yasinwaad/stw-tf-nat-gateway.git?ref=v1.0.0"

  project_name        = "example"
  environment         = "dev"
  owner               = "Yasin"
  resource_group_name = "rg-example-dev-southafricanorth"
  public_ip_id        = "<public ip id from the public ip module>"
  subnet_id           = "<subnet id from the subnets and nsg module>"
}
```

## Inputs

| Name | Description | Type | Default |
|------|-------------|------|---------|
| project_name | Project name used in resource names | string | n/a |
| environment | Environment name, e.g. prod | string | n/a |
| owner | Owner tag value | string | n/a |
| resource_group_name | Name of the existing resource group | string | n/a |
| public_ip_id | ID of the public IP for the NAT Gateway | string | n/a |
| subnet_id | ID of the subnet to associate | string | n/a |
| location | Azure region (only southafricanorth allowed) | string | southafricanorth |
| sku_name | SKU of the NAT Gateway | string | Standard |

## Outputs

| Name | Description |
|------|-------------|
| nat_gateway_id | ID of the NAT Gateway |
| nat_gateway_name | Name of the NAT Gateway |

## Naming

The NAT Gateway name is generated internally as `ng-<project_name>-<environment>-<location>`.