view: looker_customer {
  sql_table_name: `Looker_Garage.Looker_CUSTOMER`
    ;;

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.COUNTRY ;;
  }

  dimension: cust_grp_id {
    type: string
    sql: ${TABLE}.CUST_GRP_ID ;;
  }

  dimension: customer_id {
    type: string
    sql: ${TABLE}.CUSTOMER_ID ;;
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
    type: string
    sql: ${TABLE}.PHONE ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }

  measure: total_customer {
    type:  count
  }
}
