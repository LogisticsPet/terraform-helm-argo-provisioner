![ci](https://github.com/LogisticsPet/terraform-helm-argo-provisioner/actions/workflows/ci.yml/badge.svg?branch=main)
![lint](https://github.com/LogisticsPet/terraform-helm-argo-provisioner/actions/workflows/lint.yml/badge.svg?branch=main)
![sec](https://github.com/LogisticsPet/terraform-helm-argo-provisioner/actions/workflows/tfsec.yml/badge.svg?branch=main)
## Introduction
Terraform module to create ArgoCD resources.

<!-- BEGIN_TF_DOCS -->
  
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | 1.10.3 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 5.82.2 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | 2.17.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | 2.35.1 |
| <a name="requirement_local"></a> [local](#requirement\_local) | 2.5.1 |
## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.82.2 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | 2.35.1 |
## Modules

No modules.
## Resources

| Name | Type |
|------|------|
| [kubernetes_manifest.argo_application](https://registry.terraform.io/providers/hashicorp/kubernetes/2.35.1/docs/resources/manifest) | resource |
| [kubernetes_manifest.argo_cd_app_project](https://registry.terraform.io/providers/hashicorp/kubernetes/2.35.1/docs/resources/manifest) | resource |
| [kubernetes_secret.git_repo](https://registry.terraform.io/providers/hashicorp/kubernetes/2.35.1/docs/resources/secret) | resource |
| [kubernetes_secret.helm_repos](https://registry.terraform.io/providers/hashicorp/kubernetes/2.35.1/docs/resources/secret) | resource |
| [aws_eks_cluster.this](https://registry.terraform.io/providers/hashicorp/aws/5.82.2/docs/data-sources/eks_cluster) | data source |
| [aws_eks_cluster_auth.this](https://registry.terraform.io/providers/hashicorp/aws/5.82.2/docs/data-sources/eks_cluster_auth) | data source |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_applications"></a> [applications](#input\_applications) | Argo CD bootstrap applications | <pre>list(object({<br/>    name = string<br/>    path = string<br/>    wave = number<br/>    destination = object({<br/>      server    = string<br/>      namespace = string<br/>    })<br/>    git = object({<br/>      repository   = string,<br/>      organization = string<br/>      token        = string<br/>    })<br/>  }))</pre> | n/a | yes |
| <a name="input_argo_namespace"></a> [argo\_namespace](#input\_argo\_namespace) | Namespace of ArgoCD Helm chart deployment. | `string` | n/a | yes |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Name of EKS cluster. | `string` | n/a | yes |
| <a name="input_helm_repos"></a> [helm\_repos](#input\_helm\_repos) | Helm Repositories to create. | <pre>list(object({<br/>    name = string,<br/>    url  = string<br/>  }))</pre> | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | Argo CD project details | <pre>object({<br/>    name        = string,<br/>    description = string<br/>    destinations = list(object({<br/>      server    = string<br/>      namespace = string<br/>    }))<br/>  })</pre> | n/a | yes |
## Outputs

No outputs.
<!-- END_TF_DOCS -->
