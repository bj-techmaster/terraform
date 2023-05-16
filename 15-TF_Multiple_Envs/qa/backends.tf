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
      name = "qa_tf_resources_ws"
    }
  }
}