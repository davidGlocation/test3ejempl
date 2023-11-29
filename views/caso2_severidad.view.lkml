# The name of this view in Looker is "Caso2 Severidad"
view: caso2_severidad {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `datos_limpios.caso2_severidad` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "City" in Explore.

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

  dimension: level {
    type: number
    sql: ${TABLE}.level ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_level {
    type: sum
    sql: ${level} ;;  }
  measure: average_level {
    type: average
    sql: ${level} ;;  }

  dimension: lugar {
    type: string
    sql: ${TABLE}.lugar ;;
  }

  dimension: num_streets {
    type: number
    sql: ${TABLE}.num_streets ;;
  }

  dimension: street {
    type: string
    sql: ${TABLE}.street ;;
  }
  measure: count {
    type: count
  }
}
