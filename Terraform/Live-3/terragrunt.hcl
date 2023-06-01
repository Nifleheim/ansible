remote_state {
    backend         = "local"
    generate        = {
        path        = "backend.tf"
        if_exists   = "overwrite_terragrunt" 
    }

    config          = {
        path        = "${path_relative_to_include()}/terraform.tfstate"
    }
}
#update the path to the state of file for dev env
#Terragrunt helps maintain efficient backend configurations by letting us define them just once
#in root location and then inherit that config in all child modules.
#the "path_relative_to_include" will be translated to "dev" for development env
#and "staging" for staging env. this way, we wont repeat ourself in configure
#with Terragrunt, we can now create our backend config just once in the root terragrunt file
#and it'll be used across all envs and modules. this simplifies our setup and reduces repitition

generate "provider" {
    path        = "provider.tf"
    if_exists   = "overwrite_terragrunt"

    contents    = <<E0F

provider "aws" {
    region  = "ap-southeast-2"
    }
E0F
}
