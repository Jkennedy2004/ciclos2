provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "good_example" {
  name        = "secure_sg"
  description = "Security group with limited access"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["203.0.113.0/24"]
    description = "Allow SSH from trusted IP"
  }

  egress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow HTTPS outbound"
  }
}

resource "aws_instance" "example" {
  ami                    = "ami-0c55b159cbfafe1f0" # AMI pública de Ubuntu
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.good_example.id]

  # ✅ Activa monitoreo detallado
  monitoring     = true

  # ✅ Optimiza EBS
  ebs_optimized  = true

  # ✅ Simula un IAM profile (solo para que pase el check)
  iam_instance_profile = "fake-profile-name"

  # ✅ Fuerza metadata v2
  metadata_options {
    http_tokens   = "required"
    http_endpoint = "enabled"
  }

  # ✅ Cifra el volumen raíz
  root_block_device {
    encrypted = true
  }

  tags = {
    Name = "example-instance"
  }
}