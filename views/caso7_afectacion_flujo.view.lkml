# The name of this view in Looker is "Caso7 Afectacion Flujo"
view: caso7_afectacion_flujo {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `datos_limpios.caso7_afectacion_flujo` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Avg Irregularity Speed" in Explore.

  dimension: avg_irregularity_speed {
    type: number
    sql: ${TABLE}.avg_irregularity_speed ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_avg_irregularity_speed {
    type: sum
    sql: ${avg_irregularity_speed} ;;  }
  measure: average_avg_irregularity_speed {
    type: average
    sql: ${avg_irregularity_speed} ;;  }

  dimension: avg_regular_speed {
    type: number
    sql: ${TABLE}.avg_regular_speed ;;
  }

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

  dimension: geo_wkt {
    type: string
    sql: ${TABLE}.geoWKT ;;
  }

  dimension: geom {
    type: string
    sql: ${TABLE}.GEOM ;;
  }

  dimension: length_meters {
    type: number
    sql: ${TABLE}.length_meters ;;
  }

  dimension: start_node {
    type: string
    sql: ${TABLE}.startNode ;;
  }

  dimension: street {
    type: string
    sql: ${TABLE}.street ;;
  }
  measure: count {
    type: count
  }
}
