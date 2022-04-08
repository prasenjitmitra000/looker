view: looker_customer_care_user_group {
  sql_table_name: `Looker_Garage.Looker_CUSTOMER_CARE_USER_GROUP`
    ;;

  dimension: cc_group_id {
    type: string
    sql: ${TABLE}.CC_GROUP_ID ;;
  }

  dimension: cc_group_name {
    type: string
    sql: ${TABLE}.CC_GROUP_NAME ;;
  }

  dimension: group_type {
    type: string
    sql: ${TABLE}.GROUP_TYPE ;;
  }

  measure: count {
    type: count
    drill_fields: [cc_group_name]
  }
}
