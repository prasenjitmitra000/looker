view: looker_incident {
  sql_table_name: `Looker_Garage.Looker_INCIDENT`
    ;;

  dimension: inc_no {
    type: string
    primary_key: yes
    sql: ${TABLE}.inc_no ;;
  }

  dimension: category_l1 {
    type: string
    sql: ${TABLE}.CATEGORY_L1 ;;
  }

  dimension: cc_user_id {
    type: string
    sql: ${TABLE}.CC_USER_ID ;;
  }

  dimension: channel {
    type: string
    sql: ${TABLE}.CHANNEL ;;
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

  dimension: contract_customer_id {
    type: string
    sql: ${TABLE}.CONTRACT_CUSTOMER_ID ;;
  }

  dimension: contract_customer_name {
    type: string
    sql: ${TABLE}.CONTRACT_CUSTOMER_NAME ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.COUNTRY ;;
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

  dimension: customer_feedback_comment {
    type: string
    sql: ${TABLE}.CUSTOMER_FEEDBACK_COMMENT ;;
  }

  dimension: customer_feedback_rating {
    type: string
    sql: ${TABLE}.CUSTOMER_FEEDBACK_RATING ;;
  }

  dimension: customer_segment {
    type: string
    sql: ${TABLE}.CUSTOMER_SEGMENT ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.DESCRIPTION ;;
  }

  dimension_group: first_response {
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
    sql: ${TABLE}.FIRST_RESPONSE_TIME ;;
  }



  dimension: is_closed {
    type: string
    sql: CAST(${TABLE}.IS_CLOSED AS string) ;;
  }

  dimension: is_escalated {
    type: string
    sql: CAST(${TABLE}.IS_ESCALATED AS string) ;;
  }

  dimension: is_nurtured {
    type: string
    sql: ${TABLE}.IS_NURTURED ;;
  }

  dimension: is_reopen {
    type: string
    sql: ${TABLE}.IS_REOPEN ;;
  }

  dimension: office {
    type: string
    sql: ${TABLE}.OFFICE ;;
  }

  dimension: owner_id {
    type: string
    sql: ${TABLE}.OWNER_ID ;;
  }

  dimension: priority {
    type: string
    sql: ${TABLE}.PRIORITY ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.STATUS ;;
  }

  dimension: sub_category_l2 {
    type: string
    sql: ${TABLE}.SUB_CATEGORY_L2 ;;
  }

  dimension: subordinate_category_l3 {
    type: string
    sql: ${TABLE}.SUBORDINATE_CATEGORY_L3 ;;
  }

  dimension: ticket_created_by {
    type: string
    sql: ${TABLE}.TICKET_CREATED_BY ;;
  }

  dimension: transfer_reason {
    type: string
    sql: ${TABLE}.TRANSFER_REASON ;;
  }

  dimension: project_name {
    type: string
    sql: ${TABLE}.PROJECT_NAME ;;
  }

  dimension: feedback_rating_non_zero {
    type: string
    sql: case when ${customer_feedback_rating} is NOT NULL then ${customer_feedback_rating} end ;;

  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: total_inc {
    type: count_distinct
    sql: ${inc_no} ;;
  }

  set: detail {
    fields: [
      inc_no,created_date,priority,channel
    ]
  }

  measure: Avg_first_response_time{
    type:average
    sql: case when date_diff(${first_response_raw},${created_raw},MINUTE) >0 then date_diff(${first_response_raw},${created_raw},MINUTE) end  ;;
    value_format_name: decimal_0
    label: "Avg First Response Time"
    drill_fields: [looker_customer_care_user.country,Avg_first_response_time]
  }

  measure:Nurturing_Rate{
    label: "Nurturing Rate"
    type: average
    sql: case when ${is_nurtured} =true then 1 else 0 end ;;
    value_format_name: percent_0
  }

  measure: AVG_FIRST_CONTACT_RESOLUTION {
    label: "Avg First Contact Resolution"
    type: average
    sql: case when ${is_escalated} =false  then 1 else 0 end ;;
    value_format_name: percent_0
  }

  measure: escalated_case_count {
    label: "Number of Escalated Cases"
    type: count
    value_format_name: decimal_0
    drill_fields: [looker_customer_care_user.country,escalated_case_count]

  }
  measure: open_cases_by_channel {
    label: "Open cases by Channel"
    type: count
    value_format_name: decimal_0
    drill_fields: [inc_no,is_closed,created_raw]
  }
  measure: closed_cases_by_channel {
    label: "Closed cases by Channel"
    type: count
    value_format_name: decimal_0
    drill_fields: [inc_no,is_closed,created_raw]
  }
  measure: volume_by_channel {
    label: "Volume by Channel"
    type: count
#    sql: ${TABLE} ;;
    drill_fields: [looker_incident.channel,volume_by_channel]
  }

  dimension: Tab_links3 {
    type: string
    sql:  CONCAT(1,2);;
    html: <Tabs2>
          <Tab2 id="cats" label="Cats">
            Here's awesome story about cats
          </Tab2>
          <Tab2 id="dogs" label="Dogs">
            Cats are way better than dogs. Go to other tab
          </Tab2>
          <Tab2 label="Fish">Are kinda smelly</Tab2>
        </Tabs2>
    ;;
  }
}
