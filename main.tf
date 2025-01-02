locals {
  distinct_git_repos = distinct([
    for app in var.applications : app.git
  ])
}

resource "kubernetes_manifest" "argo_cd_app_project" {
  manifest = {
    apiVersion = "argoproj.io/v1alpha1"
    kind       = "AppProject"
    metadata = {
      name      = var.project.name
      namespace = var.argo_namespace
    }
    spec = {
      description  = var.project.description
      sourceRepos  = [for app in var.applications : app.git.repository]
      destinations = var.project.destinations
      clusterResourceWhitelist = [
        {
          group = "*"
          kind  = "*"
        }
      ]
    }
  }
}

resource "kubernetes_secret" "git_repo" {
  depends_on = [kubernetes_manifest.argo_cd_app_project]
  for_each   = { for idx, git in local.distinct_git_repos : idx => git }

  metadata {
    namespace = var.argo_namespace
    name      = "${var.project.name}-git"
    labels = {
      "argocd.argoproj.io/secret-type" = "repository"
    }

  }
  data = {
    project  = var.project.name
    type     = "git"
    url      = each.value.repository
    username = each.value.organization
    password = each.value.token
  }
}

resource "kubernetes_secret" "helm_repos" {
  depends_on = [kubernetes_manifest.argo_cd_app_project]
  for_each   = { for repo in var.helm_repos : repo.name => repo }

  metadata {
    namespace = var.argo_namespace
    name      = "${var.project.name}-${each.key}-helm"
    labels = {
      "argocd.argoproj.io/secret-type" = "repository"
    }
  }

  data = {
    project = var.project.name
    type    = "helm"
    name    = each.value.name
    url     = each.value.url
  }
}

resource "kubernetes_manifest" "argo_application" {
  depends_on = [kubernetes_manifest.argo_cd_app_project, kubernetes_secret.helm_repos]
  for_each   = { for app in var.applications : app.name => app }

  manifest = {
    apiVersion = "argoproj.io/v1alpha1"
    kind       = "Application"
    metadata = {
      name      = each.key
      namespace = var.argo_namespace
      finalizers = [
        "resources-finalizer.argocd.argoproj.io"
      ]
      annotations = {
        "argocd.argoproj.io/sync-wave" = tostring(lookup(each.value, "sync_wave", 0))
      }
    }
    spec = {
      project = var.project.name
      source = {
        repoURL        = each.value.git.repository
        targetRevision = "HEAD"
        path           = each.value.path
        directory = {
          recurse = true
        }
      }
      destination = {
        server    = each.value.destination.server
        namespace = each.value.destination.namespace
      }
      syncPolicy = {
        automated = {
          prune    = true
          selfHeal = true
        }
        syncOptions = [
          "Retry=4",
          "Timeout=600"
        ]
      }
    }
  }
}
