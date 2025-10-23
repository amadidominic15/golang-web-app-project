variable "kubernetes_version" {
  description = "kubernetes version"
}
variable "vpc_cidr" {
  description = "default CIDR range of the VPC"
}
variable "aws_region" {
  description = "region ofaws resources"
}
variable "cluster_name" {
  description = "name of cluster"
}
variable "nodes_group" {
  description = "name of node group"
}