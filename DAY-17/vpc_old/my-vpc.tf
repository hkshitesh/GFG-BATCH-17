resource "aws_vpc" "gfg-vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name="My-GFG-VPC"
  }
}

resource "aws_subnet" "gfg-subnet" {
  vpc_id     = aws_vpc.gfg-vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "My-GFG-Subnet"
  }
}

resource "aws_internet_gateway" "gfg-gw" {
  vpc_id =aws_vpc.gfg-vpc.id

  tags = {
    Name = "My-GFG-Gateway"
  }
}

resource "aws_route_table" "gfg-rt" {
  vpc_id = aws_vpc.gfg-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gfg-gw.id
  }

   tags = {
    Name = "My-GFG-RT"
  }
}

resource "aws_route_table_association" "gfg-RT-association" {
  subnet_id      = aws_subnet.gfg-subnet.id
  route_table_id = aws_route_table.gfg-rt.id
}

resource "aws_security_group" "GFG-SG" {
  name        = "MY-GFG-SG"
  vpc_id      = aws_vpc.gfg-vpc.id

  ingress {
    description      = "TLS from VPC"
    from_port        = 20
    to_port          = 20
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]    
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "MY-GFG-SG"
  }
}

resource "aws_instance" "gfg-vpc-ec2" {
    ami="ami-007020fd9c84e18c7"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.gfg-subnet.id
    vpc_security_group_ids = [ aws_security_group.GFG-SG.id ]
    associate_public_ip_address = true

    tags = {
      Name="My-EC2-My-VPC"
    }
  
}

output "my_instance_public_ip" {
  value = aws_instance.gfg-vpc-ec2.public_ip
}