view: profiler {
#   extension: required
  dimension: numeric_dimension_to_profile {
    sql: null  ;;
  }
  measure: min_dimension_to_profile {
    hidden: yes
#   type: min
    type: string
  sql: min(${numeric_dimension_to_profile}) ;;
}
measure: max_dimension_to_profile {
    hidden: yes
# type: max
  type: string
sql: max(${numeric_dimension_to_profile}) ;;
}
measure: profiler {
  type: number
  sql: max(1) ;;
  html:
    min:{{min_dimension_to_profile._value}}<br>
    max:{{max_dimension_to_profile._value}} ;;
}
}
