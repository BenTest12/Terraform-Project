<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.0.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.0.2 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_weight_app_vmss"></a> [weight\_app\_vmss](#module\_weight\_app\_vmss) | ../modules/VMSS | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_lb.app_load_balancer](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb) | resource |
| [azurerm_lb_backend_address_pool.bepool](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb_backend_address_pool) | resource |
| [azurerm_lb_nat_pool.lbnatpool](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb_nat_pool) | resource |
| [azurerm_lb_probe.app_lb_probe](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb_probe) | resource |
| [azurerm_lb_rule.lb_rule_8080_IN](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb_rule) | resource |
| [azurerm_network_security_group.app_nsg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group) | resource |
| [azurerm_network_security_group.db_nsg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group) | resource |
| [azurerm_postgresql_flexible_server.postgres_server](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/postgresql_flexible_server) | resource |
| [azurerm_postgresql_flexible_server_configuration.db-config-no-ssl](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/postgresql_flexible_server_configuration) | resource |
| [azurerm_private_dns_zone.private_dns_zone](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone_virtual_network_link.private_dns_zone_vnl](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_public_ip.project_lb](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) | resource |
| [azurerm_resource_group.weight_app_project](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_ssh_public_key.my_key](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/ssh_public_key) | resource |
| [azurerm_storage_blob.blob_storage_name](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_blob) | resource |
| [azurerm_subnet.app-subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_subnet.db-subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_subnet_network_security_group_association.app_nsg_association](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_network_security_group_association) | resource |
| [azurerm_subnet_network_security_group_association.db_nsg_association](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_network_security_group_association) | resource |
| [azurerm_virtual_network.project_vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_password"></a> [admin\_password](#input\_admin\_password) | Admin password for the VM Scaleset | `string` | n/a | yes |
| <a name="input_admin_user"></a> [admin\_user](#input\_admin\_user) | Admin user for the VM Scaleset | `string` | n/a | yes |
| <a name="input_app_subnet_address_range"></a> [app\_subnet\_address\_range](#input\_app\_subnet\_address\_range) | Application subnet range | `string` | n/a | yes |
| <a name="input_authorized_ip_address"></a> [authorized\_ip\_address](#input\_authorized\_ip\_address) | A variable that stores my WAN IP | `string` | n/a | yes |
| <a name="input_database_subnet_address_range"></a> [database\_subnet\_address\_range](#input\_database\_subnet\_address\_range) | Postgres DB Subnet range | `string` | n/a | yes |
| <a name="input_postgres_admin_username"></a> [postgres\_admin\_username](#input\_postgres\_admin\_username) | PostgresDB Admin User Variable | `string` | n/a | yes |
| <a name="input_postgres_password"></a> [postgres\_password](#input\_postgres\_password) | PostgresDB Admin Password Variable | `string` | n/a | yes |
| <a name="input_postgres_sku_name"></a> [postgres\_sku\_name](#input\_postgres\_sku\_name) | PostgresDB Server SKU , Used to determine the server | `string` | n/a | yes |
| <a name="input_resource_group_location"></a> [resource\_group\_location](#input\_resource\_group\_location) | Resource group variable for custom locations | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource group name variable for custom RG names | `string` | n/a | yes |
| <a name="input_vnet_address_range"></a> [vnet\_address\_range](#input\_vnet\_address\_range) | Vnet address range variable | `string` | n/a | yes |
| <a name="input_weight_app_image_gallery_name"></a> [weight\_app\_image\_gallery\_name](#input\_weight\_app\_image\_gallery\_name) | My custom OS Images Gallery | `string` | n/a | yes |
| <a name="input_weight_app_image_name"></a> [weight\_app\_image\_name](#input\_weight\_app\_image\_name) | My custom Weight App OS Image name | `string` | n/a | yes |
| <a name="input_weight_app_image_resource_group_name"></a> [weight\_app\_image\_resource\_group\_name](#input\_weight\_app\_image\_resource\_group\_name) | Custom OS Image RG | `string` | n/a | yes |
| <a name="input_weight_app_image_version_name"></a> [weight\_app\_image\_version\_name](#input\_weight\_app\_image\_version\_name) | My custom Weight App OS Image version | `string` | n/a | yes |
| <a name="input_weight_app_key"></a> [weight\_app\_key](#input\_weight\_app\_key) | Public ssh identity key variable | `string` | n/a | yes |
| <a name="input_weight_app_name_prefix"></a> [weight\_app\_name\_prefix](#input\_weight\_app\_name\_prefix) | Prefix setting for custom app names | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_vmss_password"></a> [vmss\_password](#output\_vmss\_password) | taking vmss password output from vmss module and making it root output so it can be viewed |
<!-- END_TF_DOCS -->