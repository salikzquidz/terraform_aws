data "aws_eks_cluster_auth" "cluster-auth" {
    depends_on = [aws_eks_cluster.cluster]
    name       = aws_eks_cluster.cluster.name
}

provider "helm" {
  kubernetes {
    host = aws_eks_cluster.cluster.endpoint
    cluster_ca_certificate = base64decode(aws_eks_cluster.cluster.certificate_authority[0].data)
    token = data.aws_eks_cluster_auth.cluster-auth.token
    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      args = ["eks", "get-token", "--cluster-name", aws_eks_cluster.cluster.id]
      command = "aws"
    }
  }
}

# This got problem, so I used the official yaml file - k8s/components.yaml

# resource "helm_release" "metrics-server" {
#   name = "metrics-server"

#   repository = "https://kubernetes-sigs.github.io/metrics-server/"
#   chart = "metrics-server"
#   namespace = "kube-system"
#   version = "3.10.0"
#   set {
#     name = "metrics.enabled"
#     value = false // disable internal metrics
#   }
#   depends_on = [ aws_eks_fargate_profile.kube-system ]
# }