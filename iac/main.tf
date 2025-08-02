resource "aws_security_group" "good_example" {
  name        = "secure_sg"
  description = "Security group with limited access"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["203.0.113.0/24"]  # Solo acceso desde IP segura
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
