# The name of this view in Looker is "Caso1 Demora Promedio Lc"
view: caso1_demora_promedio_lc {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `datos_limpios.caso1_demora_promedio_LC` ;;
  drill_fields: [id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Avg Delay Minutes" in Explore.

  dimension: avg_delay_minutes {
    type: number
    sql: ${TABLE}.avg_delay_minutes ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_avg_delay_minutes {
    type: sum
    sql: ${avg_delay_minutes} ;;  }
  measure: average_avg_delay_minutes {
    type: average
    sql: ${avg_delay_minutes} ;;  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: date {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date ;;
  }

  dimension: end_node {
    type: string
    sql: ${TABLE}.endNode ;;
  }

  dimension: geom {
    type: string
    sql: ${TABLE}.GEOM ;;
  }

  dimension: street {
    type: string
    sql: ${TABLE}.street ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
