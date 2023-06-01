remote_state {
    backend         = "local"
    generate        = {
        path        = "backend.tf"
        if_exists   = "overwrite_terragrunt" 
    } #generate backend configuration to backend terraform file and overwrite if exist.

    config          = {
        path        = "${path_relative_to_include()}/terraform.tfstate"
    } #generate terraform state configuration file.
}

generate "provider" {
    path        = "provider.tf"
    if_exists   = "overwrite_terragrunt"
    #generate provider configuration to provider terraform state and overwrite if exist.
    contents    = <<E0F

provider "aws" {
    region  = "ap-southeast-2"
    }
E0F
}

#keep your terraform code DRY (Dont Repeat Yourself) with terragrunt.
