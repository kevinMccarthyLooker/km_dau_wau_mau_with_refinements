view: users {
  sql_table_name: `lookerdata.thelook_event_extract_201701.users`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: age {
    type: number
    sql: ${TABLE}.age ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: traffic_source {
    type: string
    sql: ${TABLE}.traffic_source ;;
  }

  dimension: zip {
    type: zipcode
    sql: ${TABLE}.zip ;;
  }

  measure: count {
    type: count
    drill_fields: [id, last_name, first_name, events.count]
  }

#   filter: country_selector {}
#   dimension: country_is_selected_country {
#     type: yesno
#     sql: {%condition country_selector%}${country}{%endcondition%} ;;
#   }
#   measure: selected_count {
#     label: "{%if selected_count._in_query%}{{_filters['country_selector']}}{%else%}Selected Count{%endif%}"
#     type: count
#     filters: [country_is_selected_country: "Yes"]
#   }

#   measure: country_selector_tile_html {type: max sql: 1 ;;
# html:
# <div style="font-size:50%;">
# Currently Selected:
# <img alt='USA' src='{% if _filters['country_selector'] == 'USA' %}@{usa_flag_image_file_location}{% elsif _filters['country_selector'] == 'UK' %}@{uk_flag_image_file_location}{%else%}@{globe_image}{%endif%}' width='75' height='35'>
# {{_filters['country_selector']}}
# </div>
# <div><p style="font-size:50%;">Make a Selection:</p>
#   <a href='https://turtletown.dev.looker.com/dashboards/10?Country=USA' target="_self">
#     <img alt='USA' src='@{usa_flag_image_file_location}' width='150' height='70'>
#   </a>
#   <a href='https://turtletown.dev.looker.com/dashboards/10?Country=UK' target="_self">
#       <img alt='USA' src='@{uk_flag_image_file_location}' width='150' height='70'>
#   </a>
# </div>
#       ;;
#   }
}
