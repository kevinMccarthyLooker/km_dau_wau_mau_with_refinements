# Developer enhanced versions of views
## Used underscores just so these notes appear at top of field picker: and are clearly special non user fields
include: "/**/users.view.lkml"
view: +users {
#Notes:
  dimension: _users_view_developer_note {description:"{{_users_view_developer_note._sql}}"#rather than duplicate the note text, just used _sql
    sql: 'Note: Developer Tools can be toggled off by not including the developer tools file in the model.*This view is used widely [system_activity_link].  Consider carefully before making any adjustments to derived table source.';;
    html: <p style="background-color:powderblue;">{{rendered_value | replace: '.','<br>'}}</p> ;;#make it pretty
  }

#Recreate fields we want unhidden specifically for developers
  dimension: _user_id_primary_key_unhidden {
    description: "we want ids hidden from users, but developers found it annoying to constantly unhide for testing and rehide"
    sql: ${id} ;;
  }

#Other Developer Widgets/Tools:
 #Raw Field Picker... We found sometimes we just want to pull a raw field value to test
  parameter: _raw_dimension_picker {description: "for quick testing on unexposed columns, you can write the raw column name in the filter bar"
    type: unquoted
  }
  dimension: _raw_dimension_picker_output {description: "use for quick testing on exposed columns with _raw_dimension_picker filter only field"
    label_from_parameter: _raw_dimension_picker
    sql: ${TABLE}.{{_raw_dimension_picker._parameter_value}} ;;
  }

 #Quick Profiling Fields
  measure: _dates_profiler {
    description: "this was useful for testing, but it's not super meaningful for users"
    type: string
    sql: concat('Range:',min(${created_raw}),' - ', max(${created_raw}), '.  Null %:', 1.0-100.0*count(${created_raw})/count(*)) ;;
  }

 #Useful for testing when this view is used with full outer joins or with tables it has _to_many relationships with
  measure: _users_records_available_count {
    description:"Count of all joined in records where this table's primary key is present (not same as distinct user ids)"
    type: string
    sql: count(${id}) ;;
  }
}
