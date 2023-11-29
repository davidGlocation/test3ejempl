# The name of this view in Looker is "Alertas Upl"
view: alertas_upl {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `datos_limpios.alertas_upl` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: f0_ {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.f0_ ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Geometria" in Explore.

  dimension: geometria {
    type: string
    sql: ${TABLE}.Geometria ;;
  }

  dimension: road_type {
    type: number
    sql: ${TABLE}.roadType ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_road_type {
    type: sum
    sql: ${road_type} ;;  }
  measure: average_road_type {
    type: average
    sql: ${road_type} ;;  }

  dimension: road_type_name {
    type: string
    sql: ${TABLE}.roadTypeName ;;
  }

  dimension: semana {
    type: string
    sql: ${TABLE}.Semana ;;
  }

  dimension: subtype {
    type: string
    sql: ${TABLE}.subtype ;;
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
    drill_fields: [road_type_name]
  }
}
