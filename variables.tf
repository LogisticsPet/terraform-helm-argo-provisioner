variable "cluster_name" {
  type        = string
  description = "Name of EKS cluster."
}

variable "argo_namespace" {
  type        = string
  description = "Namespace of ArgoCD Helm chart deployment."
}
variable "repo_url" {
  type        = string
  description = "GitOps Repo url."
}

variable "project_name" {
  type        = string
  description = "Argo CD project name."
  default     = "default"
}

variable "github_org" {
  type    = string
  default = "GitHub Organization name"
}

variable "github_token" {
  sensitive = true
  type      = string
  default   = "Github token"
}
