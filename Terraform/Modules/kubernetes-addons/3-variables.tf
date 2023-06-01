variable "env" {
  description   = "Environment Name."
  type          = string
}

variable "eks_name" {
  description   = "Name of the Cluster."
  type          = string
}

variable "enable_cluster_autoscaler" {
  description   = "Determines whether to deploy Cluster Autoscaler."
  type          = bool
  default       = false
}

variable "cluster_autoscaler_helm_version" {
  description   = "Cluster Autoscaler Helm Version."
  type          = string
}

variable "openid_provider_arn" {
  description   = "IAM OpenID Connect Provider ARN."
  type          = string
}

