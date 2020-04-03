connection: "bigquery_publicdata_standard_sql"

include: "/**/*.view.lkml"

explore: events {
  extends:[dau_wau_mau_explore_to_be_extended]
  join: users {
    sql_on: ${events.user_id}=${users.id} ;;
    relationship: many_to_one
    type: left_outer
  }
}

####################################
##DAU WAU MAU TINY TEMPLATES WITH REFINEMENTS VERSION
### 1) Fill in dau_mau__inputs_view's sql fields with the appropriate fields from your explore. Append explore name for uniqueness
view: +dau_wau_mau_support {
  dimension: date_to_use__input_field {sql:${events.created_raw};;}
  dimension: user_id__input_field {sql:${events.user_id};;}
}
#2) Use in a normal explore by adding to extends
explore: events__with_dau_wau_mau_extension {
  view_name: events
  extends: [events,dau_wau_mau_explore_to_be_extended]
}
