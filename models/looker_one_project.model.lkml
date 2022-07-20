connection : "looker_one_demo"

# include all the views
include: "/views/**/*.view"

datagroup: looker_one_project_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}



persist_with: looker_one_project_default_datagroup

explore: looker_incident {
  label: "Incident Management"
  view_label: "Incident"

  join: looker_customer_care_user {
    view_label: "Customer Care User"
    type: left_outer
    sql_on: ${looker_customer_care_user.cc_user_id} = ${looker_incident.cc_user_id}  ;;
    relationship: one_to_many
  }
  join: looker_escalation_history {
    view_label: "Escalcation History"
    type: left_outer
    sql_on: ${looker_escalation_history.inc_no} = ${looker_incident.inc_no}  ;;
    relationship: one_to_many
  }
  join: looker_office {
    view_label: "Looker Office"
    type: left_outer
    sql_on: ${looker_office.office_id}=${looker_incident.office}  ;;
    relationship: one_to_many
  }
  join: looker_customer {
    view_label: "Looker Customer"
    type: left_outer
    sql_on: ${looker_customer.customer_id}=${looker_incident.contract_customer_id}  ;;
    relationship: one_to_many
  }
}
explore:  looker_customer {}
