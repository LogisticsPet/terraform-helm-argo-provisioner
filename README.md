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
## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.82.2 |
| <a name="provider_helm"></a> [helm](#provider\_helm) | 2.17.0 |
## Modules

No modules.
## Resources

| Name | Type |
|------|------|
| [helm_release.argo-provisioner](https://registry.terraform.io/providers/hashicorp/helm/2.17.0/docs/resources/release) | resource |
| [aws_eks_cluster.this](https://registry.terraform.io/providers/hashicorp/aws/5.82.2/docs/data-sources/eks_cluster) | data source |
| [aws_eks_cluster_auth.this](https://registry.terraform.io/providers/hashicorp/aws/5.82.2/docs/data-sources/eks_cluster_auth) | data source |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_argo_namespace"></a> [argo\_namespace](#input\_argo\_namespace) | Namespace of ArgoCD Helm chart deployment. | `string` | n/a | yes |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Name of EKS cluster. | `string` | n/a | yes |
| <a name="input_github_org"></a> [github\_org](#input\_github\_org) | n/a | `string` | `"GitHub Organization name"` | no |
| <a name="input_github_token"></a> [github\_token](#input\_github\_token) | n/a | `string` | `"Github token"` | no |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Argo CD project name. | `string` | `"default"` | no |
| <a name="input_repo_url"></a> [repo\_url](#input\_repo\_url) | GitOps Repo url. | `string` | n/a | yes |
## Outputs

No outputs.
<!-- END_TF_DOCS -->
