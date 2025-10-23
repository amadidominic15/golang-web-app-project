
# EKS CLUSTER
resource "aws_eks_cluster" "eks" {
  name     = var.cluster_name
  role_arn = aws_iam_role.eks_cluster.arn
  version  = var.kubernetes_version

  vpc_config {
    endpoint_private_access = false
    endpoint_public_access  = true

    # Must be in at least two different availability zones
    subnet_ids = [
      aws_subnet.public_1.id,
      aws_subnet.public_2.id,
      aws_subnet.private_1.id,
      aws_subnet.private_2.id
    ]
  }

  depends_on = [
    aws_iam_role_policy_attachment.amazon_eks_cluster_policy,
    aws_vpc.vpc,
  ]
}

# EKS NODE GROUP
resource "aws_eks_node_group" "nodes_group" {
  cluster_name = aws_eks_cluster.eks.name

  node_group_name = var.nodes_group
  node_role_arn   = aws_iam_role.nodes_group.arn

  subnet_ids = [
    aws_subnet.private_1.id,
    aws_subnet.private_2.id
  ]

  scaling_config {
    desired_size = 2
    max_size     = 3
    min_size     = 1
  }

  ami_type       = "AL2023_x86_64_STANDARD"
  capacity_type  = "ON_DEMAND"
  disk_size      = 20
  instance_types = ["t3.small"]

  labels = {
    role = "nodes-group"
  }

  # Kubernetes version
  version = var.kubernetes_version

  depends_on = [
    aws_iam_role_policy_attachment.amazon_eks_worker_node_policy_general,
    aws_iam_role_policy_attachment.amazon_eks_cni_policy_general,
    aws_iam_role_policy_attachment.amazon_ec2_container_registry_read_only,
  ]
}