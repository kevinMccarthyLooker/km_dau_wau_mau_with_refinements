include: "/**/events.view"
include: "/**/profiler.view"
view: +events {
  dimension: numeric_dimension_to_profile {
    sql: ${created_year}  ;;
  }
  measure: min_dimension_to_profile {
    hidden: yes
    type: min
    sql: ${numeric_dimension_to_profile} ;;
  }
  measure: max_dimension_to_profile {
    hidden: yes
    type: max
    sql: ${numeric_dimension_to_profile} ;;
  }
  measure: profiler {
    type: number
    sql: max(1) ;;
    html:
      min:{{min_dimension_to_profile._value}}<br>
      max:{{max_dimension_to_profile._value}} ;;
  }
}
