connection: "bigquery_publicdata_standard_sql"

include: "/**/users.view.lkml"
include: "/**/events.view.lkml"

include: "/**/events_add_profiler"
view: +events {
  dimension: numeric_dimension_to_profile {sql: ${created_month};;}
  ##generic fields that leverage dimension_to_profile added in events_add_profiler
}

explore: events {
  join: users {
    sql_on: ${events.user_id}=${users.id} ;;
    relationship: many_to_one
    type: left_outer
  }
}
