# The name of this view in Looker is "Malla Trafico Speed Delay Mes"
view: malla_trafico_speed_delay_mes {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `datos_limpios.malla_trafico_speed_delay_mes` ;;
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
    # This dimension will be called "City" in Explore.

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: delay {
    type: number
    sql: ${TABLE}.delay ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_delay {
    type: sum
    sql: ${delay} ;;  }
  measure: average_delay {
    type: average
    sql: ${delay} ;;  }

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

  dimension: mes {
    type: number
    sql: ${TABLE}.mes ;;
  }

  dimension: nombre_via {
    type: string
    sql: ${TABLE}.NOMBRE_VIA ;;
  }

  dimension: speed_kmh {
    type: number
    sql: ${TABLE}.speedKMH ;;
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
