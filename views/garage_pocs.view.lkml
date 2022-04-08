view: garage_pocs {
  sql_table_name: `Looker_Garage.Garage_POCS`
    ;;

  dimension: customer {
    type: string
    sql: ${TABLE}.Customer ;;
  }

  dimension: overall_status {
    type: string
    description: "Status"
    sql: ${TABLE}.Overall_Status ;;
  }

  dimension: poc_description {
    type: string
    description: "Description"
    sql: ${TABLE}.POC_Description ;;
  }

  dimension: poc_id {
    type: string
    description: "POC ID"
    sql: ${TABLE}.POC_ID ;;
  }

  dimension: poc_name {
    type: string
    description: "Name of POC"
    sql: ${TABLE}.POC_Name ;;
  }

  dimension: rag {
    type: string
    description: "Red Green Amber"
    sql: ${TABLE}.RAG ;;
  }

  dimension: region {
    type: string
    description: "Geo"
    sql: ${TABLE}.Region ;;
  }

  measure: count {
    type: count
    drill_fields: [poc_name]
  }
}
