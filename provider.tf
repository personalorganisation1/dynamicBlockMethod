terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 4.0"
    }
  }
}


provider "github" {
  token = "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"
  # owner = "personalorganisation1"
  owner = "terrademo"

}

resource "github_team" "developer" {
    


  for_each = local.terra_teams
  name     = each.key
}



# resource "github_team_membership" "members" {
#   for_each = { for tm in local.teamsflat : "${tm.name}.${tm.teamname}" => tm }

#   team_id  = github_team.developer[each.value.teamname].id 
#   username = each.value.name
# }

# output "terrateams" {
#   value = local.terra_teams
# }
# output "flat"{
#     value = local.teamsflat
# }



resource "github_team_members" "team_members" {

    for_each = local.terra_teams
    team_id  = github_team.developer[each.key].id

    dynamic "members" {
      for_each = each.value
      content {

      username = members.value
      }

    }
    }

# data "github_organization_teams" "all" {

# }

# output "d1" {
#     value = yamlencode("${data.github_organization_teams.all}")
# }


# output "gitteamslocal" {
#     value = local.git_teams
# }






# dynamic "set" {
#     for_each = [raghava,ram]
#     resource ""
# }