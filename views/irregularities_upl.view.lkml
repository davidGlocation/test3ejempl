# The name of this view in Looker is "Irregularities Upl"
view: irregularities_upl {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `datos_limpios.irregularities_upl` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Alerts Count" in Explore.

  dimension: alerts_count {
    type: number
    sql: ${TABLE}.alertsCount ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_alerts_count {
    type: sum
    sql: ${alerts_count} ;;  }
  measure: average_alerts_count {
    type: average
    sql: ${alerts_count} ;;  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: date {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date ;;
  }

  dimension: drivers_count {
    type: number
    sql: ${TABLE}.driversCount ;;
  }

  dimension: geometria {
    type: string
    sql: ${TABLE}.Geometria ;;
  }

  dimension: severity {
    type: number
    sql: ${TABLE}.severity ;;
  }

  dimension: total {
    type: number
    sql: ${TABLE}.total ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: upl {
    type: string
    sql: ${TABLE}.UPL ;;
  }

  dimension: upl_codigo {
    type: string
    sql: ${TABLE}.UPL_Codigo ;;
  }
  measure: count {
    type: count
  }
}
