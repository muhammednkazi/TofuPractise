resource "aws_vpc_peering_connection" "this" {
  vpc_id        = var.requester_vpc_id
  peer_vpc_id   = var.accepter_vpc_id
  auto_accept   = var.auto_accept
  #peer_region   = var.peer_region
  tags = {
    Name = var.peering_name
  }
}

resource "aws_route" "requester_to_accepter" {
  count                     = var.create_routes ? 1 : 0
  route_table_id            = var.requester_route_table_id
  destination_cidr_block    = var.accepter_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.this.id
}

resource "aws_route" "accepter_to_requester" {
  count                     = var.create_routes ? 1 : 0
  route_table_id            = var.accepter_route_table_id
  destination_cidr_block    = var.requester_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.this.id
}