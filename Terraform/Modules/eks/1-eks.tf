resource "aws_iam_role" "eks" {
    name = "${var.env}-${var.eks_name}-eks-cluster"
    
    assume_role_policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect"        : "Allow",
            "Principal"     : {
                "Service"   : "eks.amazonaws.com" 
            },
            "Action"        : "sts:AssumeRole"
        }
    ]
}
POLICY
}
#Before setup EKS Control Plane, Create IAM role with EKS principal

resource "aws_iam_role_policy_attachment" "eks" {
    policy_arn  = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
    role        = aws_iam_role.eks.name
}
#After that, we must attach the AmazonEKSClusterPolicy which allows EKS to create EC2 and LB

resource "aws_eks_cluster" "this" {
    name        = "${var.env}-${var.eks_name}" #use env var and pass eks name var
    version     = var.eks_version
    role_arn    = aws_iam_role.eks.arn #attach iam role to cluster

    vpc_config {
      endpoint_private_access   = false
      endpoint_public_access    = true
#we need to parameterize these values
#for now we turn off private endpoint since we dont have VPN in this cluster
#and enable the public endpoint, this way we can access EKS from laptop and deploy apps
      subnet_ids                = var.subnet_ids
    }   
#supply subnet for eks, which should be located in at least 2 AZs
#Amazon EKS sets up cross-acc eni in these subnets to enable communication between our woker nodes
#and K8S control plane
  depends_on = [aws_iam_role_policy_attachment.eks]
 } 
#we'll pass this var dynamically from VPC module using Terragrunt dependency feature

