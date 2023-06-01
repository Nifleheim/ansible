variable "env" {
  description   = "Environment Name."
  type          = string 
  }

variable "vpc_cidr_block" {
  description   = "CIDR (Classless Inter-Domain Routing)."
  type          = string
  default       = "10.0.0.0/16"
  }

variable "azs" {
  description   = "Availability Zones for Subnets."
  type          = list(string)
}

variable "private_subnets" {
  description   = "CIDR Range for Private Subnets."
  type          = list(string)
}

variable "public_subnets" {
  description   = "CIDR Range for Public Subnets."
  type          = list(string)
}

variable "private_subnet_tags" {
  description   = "Private Subnet Tags."
  type          = map(any)  
}

variable "public_subnet_tags" {
  description   = "Public Subnet Tags."
  type          = map(any)  
}

