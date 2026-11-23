output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.main.id
}

output "public_subnet_id" {
  description = "ID of the public subnet"
  value       = aws_subnet.public.id
}

output "internet_gateway_id" {
  description = "ID of the Internet Gateway"
  value       = aws_internet_gateway.igw.id
}

output "security_group_id" {
  description = "ID of the web server Security Group"
  value       = aws_security_group.web_sg.id
}

output "ec2_instance_id" {
  description = "ID of the EC2 web server"
  value       = aws_instance.web_server.id
}

output "ec2_public_ip" {
  description = "Public IP of the web server"
  value       = aws_instance.web_server.public_ip
}
