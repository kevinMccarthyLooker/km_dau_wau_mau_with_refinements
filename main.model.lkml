connection: "bigquery_publicdata_standard_sql"

include: "/views/events.view.lkml"
include: "/views/users.view.lkml"

####################################
##DAU WAU MAU TINY TEMPLATES WITH REFINEMENTS VERSION
### 1) Fill in dau_mau__inputs_view's sql fields with the appropriate fields from your explore.
# include: "/dau_wau_mau_support.view"
include: "//dau_wau_mau_support__remote_dependency/dau_wau_mau_support.view"
view: +dau_wau_mau_support {
  dimension: date_to_use__input_field {sql:${events.created_raw};;}
  dimension: user_id__input_field {sql:${events.user_id};;}
}

### 2) add the extension shown bnelow to your explore
explore: events {
  extends:[dau_wau_mau_explore_to_be_extended]
  join: users {
    sql_on: ${events.user_id}=${users.id} ;;
    relationship: many_to_one
    type: left_outer
  }
}
