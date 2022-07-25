view: looker_escalation_history {
  sql_table_name: `Looker_Garage.Looker_ESCALATION_HISTORY`
    ;;

  dimension: age_at_which_inc_escalated {
    type: number
    sql: ${TABLE}.AGE_AT_WHICH_INC_ESCALATED ;;
  }

  dimension: cc_user_id {
    type: string
    sql: ${TABLE}.CC_USER_ID ;;
  }

  dimension_group: closed {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    datatype: datetime
    sql: ${TABLE}.CLOSED_DATE ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    datatype: datetime
    sql: ${TABLE}.CREATED_DATE ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.DESCRIPTION ;;
  }

  dimension: escalation_status {
    type: string
    sql: ${TABLE}.ESCALATION_STATUS ;;
  }

  dimension: escalation_type {
    type: string
    sql: ${TABLE}.ESCALATION_TYPE ;;
  }

  dimension: inc_no {
    type: string
    sql: ${TABLE}.INC_NO ;;
  }

  dimension: reason {
    type: string
    sql: ${TABLE}.REASON ;;
  }

  dimension: role {
    type: string
    sql: ${TABLE}.ROLE ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: total_esc {
    type: count_distinct
    sql: ${inc_no} ;;
    }
  measure: escalation_trend_by_channel {
    label: "Escalation Trend by Channel"
    type: count
    sql: case when ${escalation_status} =true then 1 else 0 end ;;
    value_format_name: decimal_0
  }
}
