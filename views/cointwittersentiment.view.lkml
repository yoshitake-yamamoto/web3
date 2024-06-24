# The name of this view in Looker is "Cointwittersentiment"
view: cointwittersentiment {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `web3-da-ai-looker.off_chain_data_web3_looker_updated.coin-twitter-sentiment` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Coin" in Explore.

  dimension: coin {
    type: string
    sql: ${TABLE}.coin ;;
  }

  dimension: sentiment {
    type: string
    sql: ${TABLE}.sentiment ;;
  }

  #-------------------------
  # measures
  #-------------------------

  measure: count {
    type: count
  }

  measure: count_positive {
    type: count
    filters: [sentiment: "positive"]
  }

  measure: count_negative {
    type: count
    filters: [sentiment: "negative"]
  }

  measure: count_neutral {
    type: count
    filters: [sentiment: "neutral"]
  }

}
