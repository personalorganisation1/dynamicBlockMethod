locals {
  # git_teamspersonal = tomap(yamldecode(file("users.yaml")))["teams"]

  terra_teams = tomap(yamldecode(file("terrademouser.yaml")))["teams"]

}
# locals {
#   flattened_users = flatten({for i ,v in local.terra_teams:{
#     for j in v: {
#       team = i
#       name = j
#     }
#   }})
# }
# locals {
#   d1 = {for i,v in local.flattened_users: i=>v}
# }
# locals {
#   d2 = {for i,v in local.d1 : values(i)=>keys(i)}
# }
# locals {
#   dmap = tomap(local.d1)
# }

# this 
# locals {
#   teamsflat = flatten([
#     for team, members in local.terra_teams : [
#       for tn, t in members : {
#         name    = t
#         teamname   = team
        
#       } 
#     ]
#   ])
# }