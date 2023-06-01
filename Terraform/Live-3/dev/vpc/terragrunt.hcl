terraform {
    source = "../../../Modules/vpc"
}
#start by defining the source for the module, the "local path".

include "root" {
    path = find_in_parent_folders() 
}
#we'll include the root terragrunt file that we defined earlier, outside vpc folder.
#this will generate backend config and setup the provider.

inputs = {
    env               = "dev"
    azs               = ["ap-southeast-2a", "ap-southeast-2b"]
    private_subnets   = ["10.0.0.0/19", "10.0.32.0/19"]
    public_subnets    = ["10.0.64.0/19", "10.0.96.0/19"]

    private_subnet_tags = {
    "kubernetes.io/role/internal-elb"   = "1"
    "kubernetes.io/cluster/dev-demo"    = "owned"
    }
  
    public_subnet_tags = {
    "kubernetes.io/role/elb"            = "1"
    "kubernetes.io/cluster/dev-demo"    = "owned"
    }
}
#provide the same terraform vars that we used in the previous example.
#this part is identical to a regular module
