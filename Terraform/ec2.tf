provider "aws" {
    region = "us-east-1"
    profile = "configs"

}

resource "aws_instance" "webserver" {
    ami = "ami-08982f1c5bf93d976" 
    instance_type = "t2.micro"
   vpc_security_group_ids = ["sg-0d186509748b7a67d"]
}


resourse "aws_security_group" "sg-webserver" {
    ingress {
        description = "Allow HTTP"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]

    }
}

