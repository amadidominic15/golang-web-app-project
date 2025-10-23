resource "helm_release" "nginx_ingress" {
  name             = "nginx-ingress"
  repository       = "https://kubernetes.github.io/ingress-nginx"
  chart            = "ingress-nginx"
  version          = "4.11.0"
  namespace        = "nginx-system"
  create_namespace = true
  depends_on       = [aws_eks_cluster.eks]

  values = [
    yamlencode({
      controller = {
        replicaCount = 1
        metrics      = { enabled = true }
        ingressClassResource = {
          name    = "nginx"
          enabled = true
          default = true
        }
        admissionWebhooks = {
          enabled = false
        }
      }
    })
  ]
}
