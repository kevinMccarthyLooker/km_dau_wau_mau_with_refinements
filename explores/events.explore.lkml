include: "/**/*.view.lkml"
# explore: events {
#   join: users {
#     sql_on: ${events.user_id}=${users.id} ;;
#     relationship: many_to_one
#     type: left_outer
#   }
# }
include: "/**/country_selector_dashboard_specific_fields.lkml" #optional enhancement to users view
explore: events {
  hidden: yes
  view_name: events
  join: users {
    sql_on: ${events.user_id}=${users.id} ;;
  # foreign_key: user_id
  relationship: many_to_one
  type: left_outer
}
}
