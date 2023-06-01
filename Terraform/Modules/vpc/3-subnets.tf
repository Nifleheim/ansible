resource "aws_subnet" "private" {
  count               = length(var.private_subnets)
#lenght to check how lenght for this count
#create as many private subnet as needed bases on input provided to the module.
  vpc_id              = aws_vpc.this.id
  cidr_block          = var.private_subnets[count.index]
  availability_zone   = var.azs[count.index]

  tags                = merge( 
    { Name = "${var.env}-private-${var.azs[count.index]}" },
    var.private_subnet_tags
    )
}
#for tags, we use built-in merge function to combine the provided tags with name tag.


resource "aws_subnet" "public" {
  count               = length(var.public_subnets)

  vpc_id              = aws_vpc.this.id
  cidr_block          = var.public_subnets[count.index]
  availability_zone   = var.azs[count.index]

  tags                = merge( 
    { Name = "${var.env}-public-${var.azs[count.index]}" },
    var.public_subnet_tags
    )
}
