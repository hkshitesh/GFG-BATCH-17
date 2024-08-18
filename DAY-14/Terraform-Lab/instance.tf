resource "aws_instance" "gfg-instance" {
  ami                     = "ami-007020fd9c84e18c7"
  instance_type           = "t2.micro"
  tags= {
    Name= "My-Ec2-Instnace"
  }
}