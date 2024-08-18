resource "aws_instance" "gfg-instance-1" {
    ami = var.my_ami
    instance_type = var.my_instance_type  
    tags = {
      Name= "My-EC2-Instance-gfg"
    }  
}
