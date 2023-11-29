# The name of this view in Looker is "Caso8 Afectacion Flujo"
view: caso8_afectacion_flujo {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `datos_limpios.caso8_afectacion_flujo` ;;
  drill_fields: [id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.ID ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Avg Regular Speed" in Explore.

  dimension: avg_regular_speed {
    type: number
    sql: ${TABLE}.avg_regular_speed ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_avg_regular_speed {
    type: sum
    sql: ${avg_regular_speed} ;;  }
  measure: average_avg_regular_speed {
    type: average
    sql: ${avg_regular_speed} ;;  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: end_node {
    type: string
    sql: ${TABLE}.endNode ;;
  }

  dimension: geom {
    type: string
    sql: ${TABLE}.GEOM ;;
  }

  dimension: id_corte {
    type: number
    sql: ${TABLE}.ID_CORTE ;;
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
