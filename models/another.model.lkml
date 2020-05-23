connection: "bigquery_publicdata_standard_sql"

# ## Enable these refined versions for additional developer info
# include: "/**/*@{developer_mode}.lkml"
include:"/**/developer_tools__users"
# include: "/**/*{{_user_attributes['id']}}.lkml"
include: "/**/*250.lkml"


#explores defined in their own files and manifested in models by including them
# include: "/**/users.explore.lkml"
# explore: +users {}
include: "/**/events.explore.lkml"
