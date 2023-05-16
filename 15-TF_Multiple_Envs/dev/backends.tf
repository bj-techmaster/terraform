/*
terraform {
  backend "remote" {
    organization = "org-name-here"

    workspaces {
      name = "workspace-name-here"
    }
  }
}
*/

terraform {
  cloud {
    organization = "ORGNAME"

    workspaces {
      name = "dev_tf_resources_ws"
    }
  }
}