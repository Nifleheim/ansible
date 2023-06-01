terraform {
    source = "../../../infrastructure-modules/eks"
}

include "root" {
    path = find_in_parent_folders() 
}

include "env" {
    path              = find_in_parent_folders("env.hcl")
    expose            = true
    merge_strategy    = "no_merge"

}


inputs = {
    eks_version       = "1.26"
    env               = include.env.locals.env
    eks_name          = "demo"
    subnet_ids        = dependency.vpc.outputs.private_subnet_ids 
    #vpc private subnet as dependency for eks input

    node_groups       = {
        general       = {
            capacity_type   = "ON_DEMAND"
            instance_types  = ["t3.medium"]
            scaling_config  = {
                desired_size    = 3
                max_size        = 5
                min_size        = 1
            }
        }
    } 
} #create node group with type of instance and scaling config size

dependency "vpc" {
    config_path = "../vpc"

    mock_outputs = {
      private_subnet_ids = ["subnet-1234", "subnet-5678"]
    }
} #dependency with vpc, so it cant run if vpc didnt run first
