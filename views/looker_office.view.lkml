view: looker_office {
  sql_table_name: `Looker_Garage.Looker_Office`
    ;;

  dimension: country {
    type: string
    map_layer_name: countries
    sql: case when ${TABLE}.COUNTRY='UK' then 'United Kingdom'
              when ${TABLE}.COUNTRY='UAE' then 'United Arab Emirates'
              when ${TABLE}.COUNTRY='Hong Kong' then 'China'
              else ${TABLE}.COUNTRY end;;
  }

  dimension: office_id {
    type: string
    sql: ${TABLE}.OFFICE_ID ;;
  }

  dimension: office_name {
    type: string
    sql: ${TABLE}.OFFICE_NAME ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.EMAIL ;;
  }


  dimension: head_quarter {
    type: string
    sql: case when ${TABLE}.head_QUARTER is not null then ${TABLE}.head_QUARTER end;;
  }

  dimension: phone {
    type: string
    sql: ${TABLE}.PHONE ;;
  }
  measure: count {
    type: count

  }
  measure: total_office {
    type: count_distinct
    sql: ${office_id} ;;
    drill_fields: [office_name,country,head_quarter]
  }
}
