include: "/**/events.explore.lkml"
include: "/**/developer_tools.lkml"
explore: +events {join: developer_system_tools {sql:;;relationship:one_to_one}}
