data "aws_ami" "fck_nat" {
  most_recent = true
  owners      = ["568608671756"]

  filter {
    name   = "name"
    values = ["fck-nat-al2023-*x86_64*"]
  }
}

resource "aws_instance" "fck_nat" {
  ami                         = data.aws_ami.fck_nat.id
  instance_type               = "t3.micro"
  subnet_id                   = module.vpc.public_subnets[0]
  associate_public_ip_address = true
  source_dest_check           = false
  key_name                    = var.ec2_key_name

  vpc_security_group_ids = [
    aws_security_group.egress.id,
    aws_security_group.public_ssh.id
  ]

  tags = {
    Name = "fck-nat"
  }
}

resource "aws_route" "private_default_via_nat" {
  for_each               = toset(module.vpc.private_route_table_ids)
  route_table_id         = each.value
  destination_cidr_block = "0.0.0.0/0"
  instance_id            = aws_instance.fck_nat.id
}