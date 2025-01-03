resource "aws_instance" "web" {
  ami                    = "ami-01816d07b1128cd2d"      #change ami id for different region
  instance_type          = "t2.large"
  key_name               = "achi"              #change key name as per your setup
  vpc_security_group_ids = [aws_security_group.devops-project-achi.id]
  user_data              = templatefile("./install.sh", {})

  tags = {
    Name = "project-MainEc2"
  }

  root_block_device {
    volume_size = 40
  }
}

resource "aws_security_group" "devops-project-achi" {
  name        = "devops-project-achi"
  description = "Allow TLS inbound traffic"

  ingress = [
    for port in [22, 80, 443, 8080, 9000, 3000, 8082, 8081] : {
      description      = "inbound rules"
      from_port        = port
      to_port          = port
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "devops-project-veera"
  }
}
