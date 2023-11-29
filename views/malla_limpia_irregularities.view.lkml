# The name of this view in Looker is "Malla Limpia Irregularities"
view: malla_limpia_irregularities {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `datos_limpios.malla_limpia_irregularities` ;;
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

  dimension: end_node {
    type: string
    sql: ${TABLE}.endNode ;;
  }

  dimension: geom {
    type: string
    sql: ${TABLE}.GEOM ;;
  }

  dimension: length_line {
    type: number
    sql: ${TABLE}.lengthLine ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_length_line {
    type: sum
    sql: ${length_line} ;;  }
  measure: average_length_line {
    type: average
    sql: ${length_line} ;;  }

  dimension: street {
    type: string
    sql: ${TABLE}.street ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
