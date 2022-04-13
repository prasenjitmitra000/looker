connection : "looker_one_demo"

# include all the views
include: "/views/**/*.view"

datagroup: looker_one_project_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: looker_one_project_default_datagroup


explore:  looker_customer {}
