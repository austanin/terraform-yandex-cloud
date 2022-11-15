#### Availability zones ####

variable "aval-zone-1" {
    type = string
}

variable "aval-zone-2" {
    type = string
}

variable "aval-zone-3" {
    type = string
}



#### Yandex provider vars ####

variable "token" {
    type = string
}

variable "cloud_id" {
    type = string
}

variable "token_id" {
    type = string
}



#### Yandex low-infra vars ####

### Name of the folder in your cloud
variable "folder_id" {
    type = string
}



#### Yandex network vars ####


### VPC

## Vpc name
variable "vpc_name" {
    type = string
}

## Vpc desciption
variable "vpc_description" {
    type = string
}

## Egress gateway
variable "egress-gateway_name" {
    type = string
}


### Subnets

## Subnet 1
variable "subnet1_name" {
    type = string
}

variable "subnet1_description" {
    type = string
}

variable "subnet1_CIDR" {
    type = string
}

## Route table 1
variable "route-table1" {
    type = string
}

## Subnet 2
variable "subnet2_name" {
    type = string
}

variable "subnet2_description" {
    type = string
}

variable "subnet2_CIDR" {
    type = string
}

## Route table 2
variable "route-table2" {
    type = string
}