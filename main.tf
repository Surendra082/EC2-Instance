# Fetch Default VPC
data "aws_vpc" "default" {
  default = true
}

# Fetch Subnets from Default VPC
data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}


resource "aws_instance" "web" {
  ami           = var.myami
  instance_type = var.myinstance
  key_name      = var.mykey
  subnet_id     = sort(data.aws_subnets.default.ids)[0]
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  associate_public_ip_address = true

  tags = {
    Name        = "Terraform-EC2"
    Environment = "Dev"
  }
}

resource "aws_security_group" "ec2_sg" {
  name        = "terraform-ec2-sg"
  description = "Allow SSH access"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "terraform-ec2-sg"
  }
}

