view: test_customer_care_user {
  sql_table_name: `ai-accelerators-dai.Looker_test_2.TEST_CUSTOMER_CARE_USER`
    ;;

  dimension: cc_group_id {
    type: string
    sql: ${TABLE}.CC_GROUP_ID ;;
  }

  dimension: cc_user_id {
    type: string
    sql: ${TABLE}.CC_USER_ID ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.COUNTRY ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.EMAIL ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.NAME ;;
  }

  dimension: office {
    type: string
    sql: ${TABLE}.OFFICE ;;
  }

  dimension: phone {
    type: number
    sql: ${TABLE}.PHONE ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
