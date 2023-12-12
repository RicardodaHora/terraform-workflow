
variable "project" {
  type    = string
  default = "pbeat04042280-qa-4e56-smarthub"
}

variable "environment" {
  type    = string
  default = "prod"
}

variable "service_account" {
  type    = string
  default = "service-657417059206@gcp-sa-dataform.iam.gserviceaccount.com"
}

variable "region" {
  type    = string
  default = "us-central1"
}

variable "secret_git" {
  type    = string
  default = "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"
}

variable "secret_data" {
  type    = string
  default = "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"
}

#variable "credentials_file" { }

variable "zone" {
  default = "us-central1-c"
}

variable "remote_url" { }

variable "default_database" {
  default = "pbeat04042280-prod-3a63-smarth"
}


