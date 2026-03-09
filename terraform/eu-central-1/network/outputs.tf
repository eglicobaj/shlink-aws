output "vpc_id" { value = module.vpc.vpc_id }

output "public_subnets"  { value = module.vpc.public_subnets }
output "private_subnets" { value = module.vpc.private_subnets }

output "sg_public_ssh"        { value = aws_security_group.public_ssh.id }
output "sg_load_balancer"     { value = aws_security_group.load_balancer.id }
output "sg_balanced_instance" { value = aws_security_group.balanced_instance.id }
output "sg_egress"            { value = aws_security_group.egress.id }

output "nat_instance_id" { value = aws_instance.fck_nat.id }