project_name: "km_dau_wau_mau_with_refinements"

# # Use local_dependency: To enable referencing of another project
# # on this instance with include: statements
#
local_dependency: {
  project: "dau_wau_mau_support"
}

remote_dependency: dau_wau_mau_support__remote_dependency {
  url: "git://github.com/kevinMccarthyLooker/dau_wau_mau_support.git"
  ref: "master"
}
