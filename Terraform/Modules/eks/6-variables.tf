variable "env" {
  description   = "Environment Name."
  type          = string
}

variable "eks_version" {
  description   = "Desired Kubenetes Master Version."
  type          = string
}

variable "eks_name" {
  description   = "Name of the Cluster."
  type          = string
}

variable "subnet_ids" {
  description   = "List of Subnets ID. Must be in at least two different available az."
  type          = list(string)
}   

variable "node_iam_policies" {
  description   = "List of IAM Policies to attach to EKS-Managed Nodes."
  type          = map(any)
  default = {
    1 = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
    2 = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
    3 = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
    4 = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  }
}

variable "node_groups" {
  description   = "EKS Node Groups."
  type          = map(any)
}

variable "enable_irsa" {
    description = "Determines whether to create an OIDC Provider for EKS."
    type        = bool
    default     = true
}

