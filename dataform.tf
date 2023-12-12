
provider "google-beta"{
  project = var.project
  region = var.region
}

resource "google_sourcerepo_repository" "git_repository" {
  provider = google-beta
  name = "dataform"
}

#  resource "google_secret_manager_secret" "secret" {
#    provider = google-beta
#    secret_id = "dataform"

#    replication {
#      auto {}
#    }
#  }

# resource "google_secret_manager_secret_version" "secret_version" {
#   provider = google-beta
#   secret = google_secret_manager_secret.secret.id
#   secret_data = var.secret_data
# }


data "google_secret_manager_secret" "existing_secret" {
  provider = google-beta
  secret_id = "dataform"
}

data "google_secret_manager_secret_version" "existing_secret_version" {
  provider = google-beta
  secret = data.google_secret_manager_secret.existing_secret.id
  version = "latest"
}

resource "google_dataform_repository" "dataform_respository" {
  provider = google-beta
  name = "dataform"

  git_remote_settings {
      url = var.remote_url
      default_branch = "production"
      authentication_token_secret_version = data.google_secret_manager_secret_version.existing_secret_version.id      
  }

    workspace_compilation_overrides {
    default_database = var.default_database
  }  

}

