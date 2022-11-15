terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  token     = var.token_id
  cloud_id  = var.cloud_id
  # folder_id = var.folder_id
  zone = var.aval-zone-2
}

### Create cloud folder
# resource "yandex_resourcemanager_folder" "folder1" {
#   name = var.folder_id
#   cloud_id = var.cloud_id
# }


### Create VPC
resource "yandex_vpc_network" "yandex-net" {
  name = var.vpc_name
  folder_id = var.folder_id
  description = var.vpc_description
}

## Create egress gateway
resource "yandex_vpc_gateway" "egress-gateway" {
  name = var.egress-gateway_name
  folder_id = var.folder_id
  shared_egress_gateway {}
}

## Create route table
resource "yandex_vpc_route_table" "lab-rt-a" {
  name       = var.route-table1
  network_id = "${yandex_vpc_network.yandex-net.id}"
  folder_id = var.folder_id

  static_route {
    destination_prefix = "0.0.0.0/0"
    gateway_id         = "${yandex_vpc_gateway.egress-gateway.id}"
  }
}

## Create subnets into VPC
# Subnet 1
resource "yandex_vpc_subnet" "yandex-subnet-1" {
  name           = var.subnet1_name
  description    = var.subnet1_description
  v4_cidr_blocks = [var.subnet1_CIDR]
  zone           = var.aval-zone-2
  network_id     = "${yandex_vpc_network.yandex-net.id}"
  route_table_id = "${yandex_vpc_route_table.lab-rt-a.id}"
  folder_id      = var.folder_id
}

# Subnet 2
resource "yandex_vpc_subnet" "yandex-subnet-2" {
  name           = var.subnet2_name
  description    = var.subnet2_description
  v4_cidr_blocks = [var.subnet2_CIDR]
  zone           = var.aval-zone-2
  network_id     = "${yandex_vpc_network.yandex-net.id}"
  route_table_id = "${yandex_vpc_route_table.lab-rt-a.id}"
  folder_id = var.folder_id
}
