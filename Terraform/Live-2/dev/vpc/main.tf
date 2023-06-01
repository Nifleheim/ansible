provider "aws" {
  region = "ap-southeast-2"
}
#declare AWS Provider

terraform {
  backend "local" {
    path = "dev/vpc/terraform.tfstate"
  }
}
#setup the backend, we'll continue to use 'local' state

module "vpc" { #declare VPC module
  source            = "../../../Modules/vpc" #specify the source

  env               = "dev" #declare the environment
#since it's under the 'dev' folder, it should be the development env
  azs               = ["ap-southeast-2a", "ap-southeast-2b"] 
  private_subnets   = ["10.0.0.0/19", "10.0.32.0/19"]
  public_subnets    = ["10.0.64.0/19", "10.0.96.0/19"]
#provide the AZs, private and public subnet CIDR ranges
  private_subnet_tags = {
    "kubernetes.io/role/internal-elb"   = "1"
    "kubernetes.io/cluster/dev-demo"    = "owned"
  }
#pass the same subnet tags for both private & public subnets  
  public_subnet_tags = {
    "kubernetes.io/role/elb"            = "1"
    "kubernetes.io/cluster/dev-demo"    = "owned"
  } 
}
