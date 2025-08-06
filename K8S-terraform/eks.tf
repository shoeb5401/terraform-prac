module "eks" {
  # import the eks module template
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 21.0"
  # cluster info
  name               = local.name
  kubernetes_version = "1.33"

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  # cotrol pane network
  control_plane_subnet_ids = module.vpc.intra_subnets

  endpoint_public_access = true


  enable_cluster_creator_admin_permissions = true

  compute_config = {
    enabled    = true
    node_pools = ["general-purpose"]
  }


  # Managing nodes in the cluster
  eks_managed_node_groups = {
    default_cluster = {

      ami_type       = "AL2023_x86_64_STANDARD"
      instance_types = ["t2.medium"]

      min_size     = 2
      max_size     = 3
      desired_size = 2


      capacity_type                         = "SPOT"
      attach_cluster_primary_security_group = true
      addons = {
        coredns = {
          most_recent = true

        }
        kube-proxy = {
          most_recent = true
        }
        vpc-cni = {
          most_recent = true
        }
      }
    }
  }
  tags = {
    Environment = local.env
    Terraform   = "true"
  }
}
