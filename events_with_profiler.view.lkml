# include: "/**/events.view"
#
# view: profiler_inputs {
#   dimension: numeric_dimension_to_profile {
#     sql: ${events.created_year}  ;;
#   }
#   measure: min_dimension_to_profile {
# #     hidden: yes
#     type: min
#     sql: ${profiler_inputs.numeric_dimension_to_profile} ;;
#   }
#   measure: max_dimension_to_profile {
# #     hidden: yes
#     type: max
#     sql: ${numeric_dimension_to_profile} ;;
#   }
#
#   measure: profiler {
#   type: number
#   sql: max(1) ;;
#   html:
#   min:{{min_dimension_to_profile._value}}<br>
#   max:{{max_dimension_to_profile._value}} ;;
#   }
# }


# view: +events {
#   extends: [profiler_inputs]
#   dimension: numeric_dimension_to_profile {
#     sql: ${events.created_year}  ;;
#   }
# #   dimension: numeric_dimension_to_profile {
# #     sql: ${events.created_year}  ;;
# #   }
# #   measure: min_dimension_to_profile {
# #     hidden: yes
# #     type: min
# #     sql: ${numeric_dimension_to_profile} ;;
# #   }
# #   measure: max_dimension_to_profile {
# #     hidden: yes
# #     type: max
# #     sql: ${numeric_dimension_to_profile} ;;
# #   }
#
#   measure: profiler {
#   type: number
#   sql: max(1) ;;
#   html:
#   min:{{min_dimension_to_profile._value}}<br>
#   max:{{max_dimension_to_profile._value}} ;;
# }
#
#
# }
# # explore: events {}
