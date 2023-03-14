module "eks"{
    source = "terraform-aws-modules/eks/aws"
    version = "17.1.0"
    cluster_name = local.cluster_name
    cluster_version = "1.20"
    subnets = module.vpc.private_subnets
tags = {
        Name = "Demo-EKS-Cluster"
    }
vpc_id = module.vpc.vpc_id
    workers_group_defaults = {
        root_volume_type = "gp2"
    }
project_group = [
        {
            name = "Project-Group-1"
            instance_type = "t2.medium"
            asg_desired_capacity = 2
            additional_security_group_ids = [aws_security_group.project_group_one.id]
        },
        {
            name = "Project-Group-2"
            instance_type = "t2.medium"
            asg_desired_capacity = 1
            additional_security_group_ids = [aws_security_group.project_group_two.id]
        },
    ]
}
data "aws_eks_cluster" "cluster" {
    name = module.eks.cluster_id
}
data "aws_eks_cluster_auth" "cluster" {
    name = module.eks.cluster_id
}
