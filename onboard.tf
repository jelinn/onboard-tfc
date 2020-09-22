provider "tfe" {
  hostname = var.hostname
  token    = var.token
}

resource "tfe_organization" "demoOrg" {
  name  = var.org-name
  email = var.org-email
}

resource "tfe_workspace" "demoWorkspace" {
  name         = "demo-workspace-app1"
  organization = tfe_organization.demoOrg.id
}

resource "tfe_team" "demoTeam" {
  name         = "demo-team-app1"
  organization = tfe_organization.demoOrg.id
}

resource "tfe_organization_membership" "test" {
  organization = tfe_organization.demoOrg.id
  email = tfe_organization.demoOrg.org-email
}

resource "tfe_team_organization_member" "test" {
  team_id = tfe_team.demoTeam.id
  organization_membership_id = tfe_organization_membership.test.id
}

resource "tfe_variable" "gcp_project" {
  key          = "gcp_project"
  value        = "my_value_name"
  category     = "terraform"
  workspace_id = $tfe_workspace.demoWorkspace.id
  description  = "GCP Project from Instruqt"
}

resource "tfe_variable" "google_creds" {
  key          = "GOOGLE_CREDENTIALS"
  value        = "my_value_name"
  category     = "env"
  sensitive    = "true"
  workspace_id = $tfe_workspace.demoWorkspace.id
  description  = "GCP Credentials"
}
