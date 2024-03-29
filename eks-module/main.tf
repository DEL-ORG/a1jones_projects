# Resource: aws_iam_role
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role

resource "aws_iam_role" "a1jones_aws_iam_role" {
  # The name of the role
  name = var.aws_iam_role_name

  # The policy that grants an entity permission to assume the role.
  # Used to access AWS resources that you might not normally have access to.
  # The role that Amazon EKS will use to create AWS resources for Kubernetes clusters
  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

# Resource: aws_iam_role_policy_attachment
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment

resource "aws_iam_role_policy_attachment" "a1jones_aws_iam_role_policy_attachment" {
  # The ARN of the policy you want to apply
  # https://github.com/SummitRoute/aws_managed_policies/blob/master/policies/AmazonEKSClusterPolicy
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"

  # The role the policy should be applied to
  role = aws_iam_role.a1jones_aws_iam_role.name
}

# Resource: aws_eks_cluster
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_cluster

resource "aws_eks_cluster" "eks-cluster" {
  # Name of the cluster.
  name = var.eks-cluster

  # The Amazon Resource Name (ARN) of the IAM role that provides permissions for 
  # the Kubernetes control plane to make calls to AWS API operations on your behalf
  role_arn = aws_iam_role.a1jones_aws_iam_role.arn

  # Desired Kubernetes master version
  version = var.eks-cluster-version

  vpc_config {
    # Indicates whether or not the Amazon EKS private API server endpoint is enabled
    endpoint_private_access = var.endpoint_private_access

    # Indicates whether or not the Amazon EKS public API server endpoint is enabled
    endpoint_public_access = var.endpoint_public_access

    # Must be in at least two different availability zones
    subnet_ids = var.a1jones_subnet_id

  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Cluster handling.
  # Otherwise, EKS will not be able to properly delete EKS managed EC2 infrastructure such as Security Groups.
  depends_on = [
    aws_iam_role_policy_attachment.a1jones_aws_iam_role_policy_attachment
  ]
}
