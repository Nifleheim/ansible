resource "aws_vpc" "this" {
  cidr_block            = var.vpc_cidr_block

  enable_dns_support    = true
  enable_dns_hostnames  = true

  tags = {
    Name = "${var.env}-main"
  }
}

#"${}" create dynamically var which means just prefix var env can change but not the "-main".
#you can also replace entire name with variable, not just the prefix "dev"