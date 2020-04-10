#these fields are only meant to be used with Steve's 'Click a Flag' dashboard.
include: "/basic_views/users.view.lkml"
view: +users {
  filter: country_selector {hidden:yes}
  dimension: country_is_selected_country {hidden:yes
    type: yesno
    sql: {%condition country_selector%}${country}{%endcondition%} ;;
  }
  measure: selected_count {hidden:yes
    label: "{%if selected_count._in_query%}{{_filters['country_selector']}}{%else%}Selected Count{%endif%}"
    type: count
    filters: [country_is_selected_country: "Yes"]
  }

  measure: country_selector_tile_html {hidden:yes type: max sql: 1 ;;
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
