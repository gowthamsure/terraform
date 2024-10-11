module "ec2_instance" {

source = "terraform-aws-modules/ec2-instance/aws"


name = "terraform_server"


instance_type = var.instance_type

ami = data.aws_ami.example.id

key_name = "hackathon"

monitoring = true

vpc_security_group_ids = [module.sg.security_group_id]

subnet_id = module.vpc.public_subnets[0]

associate_public_ip_address = true

availability_zone = ap-south-1

#user_data = file("jenkins-install.sh")



tags = {

Name = "terraform_server"

Terraform = "true"

Environment = "dev"

}

