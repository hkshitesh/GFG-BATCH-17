resource "aws_instance" "ec2-loop" {
    for_each = var.instances
    ami = var.instances[each.key].ami
    instance_type = "t2.micro"  

    tags = {
      Name = "GFG-${each.key}"
    }
}


variable "instances" {
    default = {
        "instance1"={
            ami = "ami-05295b6e6c790593e"
        },
        "instance2"={
            ami = "ami-007020fd9c84e18c7"
        },
        "instance3"={
            ami = "ami-05a5bb48beb785bf1"
        },
    }  
}