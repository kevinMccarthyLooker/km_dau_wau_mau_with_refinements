project_name: "km_dau_wau_mau_with_refinements"

constant: developer_mode {
  value: "_view_developer_tools"
}

constant: usa_flag_image_file_location {
  value: "https://upload.wikimedia.org/wikipedia/en/a/a4/Flag_of_the_United_States.svg"
}

constant: uk_flag_image_file_location {
  value: "https://upload.wikimedia.org/wikipedia/en/a/ae/Flag_of_the_United_Kingdom.svg"
}

constant: globe_image {
  value: "https://upload.wikimedia.org/wikipedia/commons/thumb/7/7c/MEK_II-14.jpg/1280px-MEK_II-14.jpg"
}

constant: flags_dashboard_location {
  value: "https://turtletown.dev.looker.com/embed/dashboards/10"
}

constant: highlight_cells_for_selected_country_html {
  value: "{% if _filters['events.country_selector'] == events.country._value %}<div style='background-color:lightgreen;font-weight:bold'>{{rendered_value}}</div>{%else%}<div>{{rendered_value}}</div>{%endif%}"
}
