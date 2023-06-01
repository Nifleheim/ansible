output "vpc_id" {
  value = aws_vpc.this.id
}

output "private_subnet_ids" {
  value = aws_subnet.private[*].id
}

output "public_subnet_ids" {
  value = aws_subnet.public[*].id
}

#these output var can be used later when passing information to EKS Module
#user [*] to return all created subnets, this shorcut is simple but powerful