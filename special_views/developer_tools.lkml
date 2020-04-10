###############
# general helper view for use on many/any explores
view: developer_system_tools {
  #no table: these are generic fields not tied to one table
  #can just be joined to any explore with join: developer_system_tools {sql:;;relationship:one_to_one} #which manifests as nothing in the from clause
#Tools:
  dimension: active_looker_user_id {type:number sql:{{_user_attributes['id']}};;}#may want to make certain user attributes readily available for testing, such as those affecting access
  dimension_group: current {
    description: "Can use to confirm timezone conversion, etc"
    type: time timeframes: [raw,time,date,month]
    sql: current_timestamp ;;
  }
  dimension: current_time_according_to_liquid {
    description: "May be helpful for testing liquid date logic. Did confirm it's in sync with db's current date but keeping this here for reference.  Breaks cache"
    type: date_time
    datatype: datetime
    sql: '{{ 'now' | date: '%Y-%m-%d %H:%M:%S' }}' ;;
  }
  measure: fanned_out_record_count {
    description:
    "The total record count across all joined views.
    Ignores symmetric aggregates, and also counts unmatched joined records.
    Filters do impact this result, and essentially make joins functionally inner
    *In case of very slow queries.Double check if this reasonable.  If not there may be a join with insufficient criteria"
    type: number
    sql: count(*) ;;
  }
}
#add developer_system_tools to the explores where desired.  Reminder: this enhancement only is made available when this file is included
# include: "/**/users.explore.lkml"
# explore: +users {join: developer_system_tools {sql:;;relationship:one_to_one}}
# include: "/**/events.explore.lkml"
# explore: +events {join: developer_system_tools {sql:;;relationship:one_to_one}}

#####################
## Developer enhanced versions of views
# include: "/**/users.view.lkml"
# view: +users {
# #Notes:
#   dimension: _users_view_developer_note {#underscore just so these notes appear at top of field picker and are clearly special non user fields
#     sql: 'Note: Developer Tools can be toggled off by not including the developer tools file in the model.*This view is used widely [system_activity_link].  Consider carefully before making any adjustments to derived table source.';;
#     description:"{{_users_view_developer_note._sql}}"#out that same messsage.  rather than duplicate the note text, just used _sql
#     html: <p style="background-color:powderblue;">{{rendered_value | replace: '.','<br>'}}</p> ;;#make it pretty
#   }
#
# #Tools:
#   #We found sometimes we just want to pull a raw field value to test
#   parameter: _raw_dimension_picker {
#     description: "for quick testing on unexposed columns, you can write the raw column name in the filter bar"
#     type: unquoted
#   }
#   dimension: _raw_dimension_picker_output {
#     label_from_parameter: _raw_dimension_picker
#     description: "use for quick testing on exposed columns with _raw_dimension_picker filter only field"
#     sql: ${TABLE}.{{_raw_dimension_picker._parameter_value}} ;;
#   }
#
#   dimension: _user_id_primary_key_unhidden {
#     description: "we want ids hidden from users, but developers found it annoying to constantly unhide for testing and rehide"
#     sql: ${id} ;;
#   }
#   measure: _dates_range_of_data_included {
#     description: "this was useful for testing, but it's not super meaningful for users"
#     type: string
#     sql: concat(min(${created_raw}),' - ', max(${created_raw})) ;;
#   }
#
#   #Useful for testing when this view is used with full outer joins or with tables it has _to_many relationships with
#   measure: _users_records_available_count {
#     description:"Count of all joined in records where this table's primary key is present (not same as distinct user ids)"
#     type: string
#     sql: count(${id}) ;;
#   }
# }
