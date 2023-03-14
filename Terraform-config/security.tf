resource "aws_security_group" "project_group_one" {
    name_prefix = "project_group_one"
    vpc_id = module.vpc.vpc_id
ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
cidr_blocks = [
            "10.0.0.0/8"
        ]
    }
}
resource "aws_security_group" "project_group_two" {
    name_prefix = "project_group_two"
    vpc_id = module.vpc.vpc_id
 
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
cidr_blocks = [
            "10.0.0.0/8"
        ]
    }
}
resource "aws_security_group" "all_project" {
    name_prefix = "all_project"
    vpc_id = module.vpc.vpc_id
ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
cidr_blocks = [
            "10.0.0.0/8"
        ]
    }
}
