view: looker_customer_group {
  sql_table_name: `Looker_Garage.Looker_CUSTOMER_GROUP`
    ;;

  dimension: cust_grp_id {
    type: string
    sql: ${TABLE}.CUST_GRP_ID ;;
  }

  dimension: cust_grp_nm {
    type: string
    sql: ${TABLE}.CUST_GRP_NM ;;
  }

  dimension: cust_grp_sub_type {
    type: string
    sql: ${TABLE}.CUST_GRP_SUB_TYPE ;;
  }

  dimension: cust_grp_type {
    type: string
    sql: ${TABLE}.CUST_GRP_TYPE ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
