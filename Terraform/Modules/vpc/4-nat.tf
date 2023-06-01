resource "aws_eip" "this" {
  vpc             = true

  tags            = {
    Name          = "${var.env}-nat"
  } #dynamically var which means just prefix var env can change but not the "-nat".
}

resource "aws_nat_gateway" "this" {
  allocation_id   = aws_eip.this.id
  subnet_id       = aws_subnet.public[0].id
  #[0] means first generated public subnet, maybe "10.0.0.0/19"
  tags            = {
    Name          = "${var.env}-nat"
  }

  depends_on      = [aws_internet_gateway.this]

}

