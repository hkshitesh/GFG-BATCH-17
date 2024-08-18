resource "aws_instance" "gfg-tfvars-ec2" {
    ami = var.my_ami
    instance_type = var.my_instance_type
    tags = {
      Name = var.my_instance_name
    }  
}