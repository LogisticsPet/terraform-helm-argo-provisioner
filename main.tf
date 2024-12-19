resource "helm_release" "argo-provisioner" {
  chart     = "${path.module}/helm"
  name      = "${var.project_name}-argo-provision"
  namespace = var.argo_namespace
  atomic    = true

  values = [
    yamlencode({
      appName = var.project_name
      argoNamespace : var.argo_namespace
      projectName : var.project_name
      github = {
        repo  = var.repo_url
        org   = var.github_org,
        token = var.github_token,
      }
  })]
}
