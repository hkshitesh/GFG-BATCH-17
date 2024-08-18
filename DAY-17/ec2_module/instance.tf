resource "aws_instance" "gfg-instance" {
ami = var.my-ami
instance_type = var.my-instance-type  
}