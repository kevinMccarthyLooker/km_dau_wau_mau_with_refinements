#these fields are only meant to be used with Steve's 'Click a Flag - Users' First Day' dashboard.
include: "/basic_views/users.view.lkml"
include: "/basic_views/events.view.lkml"
view: +events {
###Parameters and corresponding Dimension fields###
  parameter: country_selector {hidden:yes
    allowed_value: {value: "UK"}
    allowed_value: {value: "USA"}
  }
  dimension: country_is_selected_country {hidden:yes
    type: yesno
    sql: {%condition country_selector%}${country}{%endcondition%} ;;
  }

###Other Dimensions###
  #Note: Calculations like these that cross views are good to put in their own location so we can include them only when valid for the explore
  dimension: event_date_is_users_created_date{type: yesno sql: ${created_date}=${users.created_date} ;;}
  #override country with custom formatting for this case. Don't need to re-declare sql, etc.
  dimension: country {
#     html: @{highlight_cells_for_selected_country_html} ;;
  html: <img alt='USA' src='{% if value == 'USA' %}@{usa_flag_image_file_location}{% elsif value == 'UK' %}@{uk_flag_image_file_location}{%else%}@{globe_image}{%endif%}' width='120'> ;;
  }
###Measures###
  measure: first_day_events_count {hidden:yes label: "First Day Events Count"
    type: count
    filters: [event_date_is_users_created_date: "Yes"]
    html: {% if _filters['events.country_selector'] == events.country._value %}<div style='background-color:lightgreen;font-weight:bold'>{{rendered_value}}</div>{%else%}<div>{{rendered_value}}</div>{%endif%} ;;
  }
  measure: returner_events_count {hidden:yes label: "Returner Events Count"
    type: count
    filters: [event_date_is_users_created_date: "No"]
    html: {% if _filters['events.country_selector'] == events.country._value %}<div style='background-color:green;font-weight:bold;color:white'>{{rendered_value}}</div>{%else%}<div>{{rendered_value}}</div>{%endif%} ;;
  }
  measure: selected_country_first_day_events_count {hidden:yes
    label: "{%if selected_country_first_day_events_count._in_query%}{{_filters['country_selector']}} First Day Events{%else%}First Day Events for Selected Country{%endif%}"
    type: count
    filters: [event_date_is_users_created_date: "Yes", country_is_selected_country: "Yes"]
  }
  measure: selected_country_returner_events_count {hidden:yes
    label: "{%if selected_country_first_day_events_count._in_query%}{{_filters['country_selector']}} Returner Events{%else%}Returner Events Count for Selected Country{%endif%}"
    type: count
    filters: [event_date_is_users_created_date: "No", country_is_selected_country: "Yes"]
  }
  measure: not_selected_country_events_count {hidden:yes label: "Rest of Events (non-selected countries)"
    type: number
    sql: count(*) - ${selected_country_first_day_events_count} - ${selected_country_returner_events_count} ;;
  }
###HTML Support Fields###
  measure: country_selector_tile_html {hidden:yes
    type: max sql: 1 ;;#sql doesn't matter as this is for rendering an image. max(1) is fast.
    html:
    <div style="font-size:50%;">
    Currently Selected:
    <img alt='USA' src='{% if _filters['country_selector'] == 'USA' %}@{usa_flag_image_file_location}{% elsif _filters['country_selector'] == 'UK' %}@{uk_flag_image_file_location}{%else%}@{globe_image}{%endif%}' width='75' height='35'>
    {{_filters['country_selector']}}
    </div>
    <div><p style="font-size:50%;">Make a Selection:</p>
      <a href='@{flags_dashboard_location}?Country=USA' target="_self">
        <img alt='USA' src='@{usa_flag_image_file_location}' width='150' height='70'>
      </a>
      <a href='@{flags_dashboard_location}?Country=UK' target="_self">
          <img alt='UK' src='@{uk_flag_image_file_location}' width='150' height='70'>
      </a>
    </div>
          ;;
  }
}
