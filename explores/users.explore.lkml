include: "/**/users.view.lkml"
include: "/**/events.view.lkml"
explore: users {
  hidden: yes
  join: events {
    type: full_outer
    sql_on: ${users.id}=${events.user_id} ;;
    relationship: one_to_many
  }
}
