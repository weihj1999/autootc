# VPC Peering
This example will create two VPC inside one tenant, then create a peering to enable the connection betweem them with VPC Peering

User guide: https://www.terraform.io/docs/providers/opentelekomcloud/r/vpc_v1.html

## Design
1. Create two VPC with network module
2. Create VPC peering with connect module
3. Create ECS instance with instance module

## Architecture
![](vpc-peering-design.png)

## Introduction
### network module
Input:

| Paramemeter      | Description |
| ----------- | ----------- |
| vpc_name      | name of the VPC       |
| vpc_cidr   | cidr of the VPC        |
| subnet_name   | name of the subnet        |
| subnet_cidr   | cidr of the subnet        |
| subnet_gateway_ip   | gateway of the subnet        |

Output:

| Paramemeter      | Description |
| ----------- | ----------- |
| vpc_cidr      | cidr of the VPC       |
| vpc_id   | id of the vpc        |
| subnet_id   | uuid of the subnet        |

### connect module
Input:

| Paramemeter      | Description |
| ----------- | ----------- |
| peer_conn_name      | name of the vpc peering       |
| peer_cidr   | cidr of the remote vpc        |
| peer_vpc_id   | id of the remote vpc        |
| local_cidr   | cidr of the local vpc        |
| local_vpc_id   | id of the local vpc        |

Output:

None

### instance module
Input:

| Paramemeter      | Description |
| ----------- | ----------- |
| count      | number of the instances       |
| instance_name   | name of the instance, once count used, this will be the prefix        |
| image_id   | image id or name        |
| flavor_id   | flavor name or id        |
| keypair   | key pair        |
| security_group   | security group id or name        |
| network_id   | uuid of the specified network        |

Output:

| Paramemeter      | Description |
| ----------- | ----------- |
| ipv4_addresses      | ip addresses of the created instances, it's a list       |

## Limitation

This example only works the VPCs within same tenant. VPC peering across tenant is not covered in this example. I will provide antoher example for VPCs in different tenant. 

## Contact
[Hong Jin Wei](https://github.com/weihj1999)
