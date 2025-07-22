terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "6.6.0"
    }
  }
}

variable "github_token" {
  type = string
}

provider "github" {
  token = var.github_token
}

data "github_repositories" "these" {
  query           = "user:marifwicaksana language:HCL"
  include_repo_id = true
}

output "repos" {
  value = data.github_repositories.these.full_names
}
