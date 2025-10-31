output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnet_id" {
  value = aws_subnet.public.id
}


output "vpc_cidr_value" {
  value = aws_vpc.main.cidr_block
}

output "route_table_id" {
  value = aws_route_table.public.id
}

/*
output "private_subnet_id" {
  value = aws_subnet.private.id
}
*/
