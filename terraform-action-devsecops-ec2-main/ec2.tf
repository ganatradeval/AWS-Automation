resource "aws_instance" "my_ec2_instance" {
    ami                                  = "ami-022e1a32d3f742bd8"
    availability_zone                    = "us-east-1e"
    instance_type                        = "t2.micro"
    key_name                             = "sid-terraform"
    security_groups                      = [aws_security_group.my-sg.id]
    subnet_id                            = "subnet-05ce424831aef41aa"
    tags                                 = {
        "Name" = "ec2_dev"
    }
    tags_all                             = {
        "Name" = "ec2_dev"
    }
}

