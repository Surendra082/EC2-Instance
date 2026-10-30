output "instance_id" {
  value = aws_instance.web.id
}

output "public_ip" {
  value = aws_instance.web.public_ip
}

output "private_ip" {
  value = aws_instance.web.private_ip
}

output "vpc_id" {
  value = data.aws_vpc.default.id
}

output "subnet_id" {
  value = aws_instance.web.subnet_id
}
