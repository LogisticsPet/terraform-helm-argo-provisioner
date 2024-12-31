variable "cluster_name" {
  type        = string
  description = "Name of EKS cluster."
}

variable "argo_namespace" {
  type        = string
  description = "Namespace of ArgoCD Helm chart deployment."
}
variable "applications" {
  description = "Argo CD bootstrap applications"
  type = list(object({
    name = string
    path = string
    wave = number
    destination = object({
      server    = string
      namespace = string
    })
    git = object({
      repository   = string,
      organization = string
      token        = string
    })
  }))
}

variable "project" {
  description = "Argo CD project details"
  type = object({
    name        = string,
    description = string
    destinations = list(object({
      server    = string
      namespace = string
    }))
  })
}


variable "helm_repos" {
  description = "Helm Repositories to create."
  type = list(object({
    name = string,
    url  = string
  }))
}
