include: "/**/*.view.lkml"
# explore: events {
#   join: users {
#     sql_on: ${events.user_id}=${users.id} ;;
#     relationship: many_to_one
#     type: left_outer
#   }
# }
explore: events {
  hidden: yes
  view_name: events
  join: users {
#     sql_on: ${events.user_id}=${users.id} ;;
  foreign_key: user_id
  relationship: many_to_one
  type: left_outer
}
}
