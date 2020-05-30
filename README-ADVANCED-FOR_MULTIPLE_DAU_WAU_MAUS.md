# Readme Advanced for Multiple Dau Wau Maus


#3 (Optional) - If you end up needing multiple dau_wau_mau_support on multiple different fields, use a different extension name, and join that instead like so
#
# view: dau_wau_mau_support__user_created_date {
#   extends: [dau_wau_mau_support]
#   dimension: date_to_use__input_field {sql:${users.created_raw};;}
#   dimension: user_id__input_field {sql:${users.id};;}
# }
# explore: dau_wau_mau_support__user_created_date__explore {
#   join: dau_wau_mau_support {fields:[]}
#   extension: required
#   extends: [dau_wau_mau_explore_to_be_extended]
#   join: dau_wau_mau_support__user_created_date {
#     type: cross
#     relationship: one_to_many
#     sql_where:${dau_wau_mau_support__user_created_date.date_to_use__input_field}<current_timestamp;; #assumes there's data up through yesterday only
#   }
# }
# in place of step 2, you would add this extension instead: #extends:[dau_wau_mau_support__user_created_date__explore]
