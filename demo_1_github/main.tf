provider "github" {
  owner = "wojciech12"
}

variable "repository_name" {
  type    = string
  default = "my_app"
}

resource "github_repository" "my_repo" {
  name        = var.repository_name
  description = "OpenTofu created this repository for my NaverCloud App!"

  visibility = "public"
}
