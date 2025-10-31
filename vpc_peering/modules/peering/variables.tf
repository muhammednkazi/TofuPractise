variable "requester_vpc_id" {}
variable "accepter_vpc_id" {}
variable "requester_cidr" {}
variable "accepter_cidr" {}
variable "requester_route_table_id" {}
variable "accepter_route_table_id" {}

/*
variable "peer_region" {
  #default = null
}
*/

variable "auto_accept" {
  #default = false
}
variable "peering_name" {
  default = "vpc-peering"
}
variable "create_routes" {
  default = true
}