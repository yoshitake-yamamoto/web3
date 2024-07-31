# The name of this view in Looker is "Meme Koins Token Transfer Analytics 2"
view: meme_koins_token_transfer_analytics_2 {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `web3-da-ai-looker.on_chain_data_web3_looker.meme_koins_token_transfer_analytics_2` ;;


  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: mint {
    type: string
    sql: ${TABLE}.mint ;;
  }

  dimension_group: minted_on {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      year,
      day_of_week
    ]
    sql: CAST(PARSE_DATE('%d-%m-%Y',${TABLE}.minted_on) AS TIMESTAMP);;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: symbol {
    type: string
    sql: ${TABLE}.symbol ;;
  }

  dimension: trades {
    type: number
    sql: ${TABLE}.total_trades ;;
  }

  dimension_group: transfer {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      year,
      day_of_week
    ]
    sql: CAST(PARSE_DATE('%d-%m-%Y',${TABLE}.transfer_date) AS TIMESTAMP);; # 変換式
  }

  #-------------------------
  # measures
  #-------------------------


  measure: total_trades {
    type: sum
    drill_fields: [category, mint, minted_on_date, name, symbol, total_trades, transfer_date]
    sql: ${trades} ;;  }

  measure: average_total_trades {
    type: average
    sql: ${trades} ;;  }

  measure: count {
    type: count
    drill_fields: [category, mint, minted_on_date, name, symbol, total_trades, transfer_date]
  }

  measure: count_category {
    type: count_distinct
    sql: ${category} ;;
  }

  measure: count_mint {
    type: count_distinct
    sql: ${mint} ;;
  }

  measure: count_name {
    type: count_distinct
    sql: ${name} ;;
  }

  measure: count_symbol {
    type: count_distinct
    sql: ${symbol} ;;
  }


}
