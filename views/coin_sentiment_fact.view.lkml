view: coin_sentiment_fact {
    derived_table: {
    sql: SELECT
        cointwittersentiment.coin  AS cointwittersentiment_coin,
        COUNT(*) AS cointwittersentiment_count,
        COUNT(CASE WHEN (( cointwittersentiment.sentiment  ) = 'positive') THEN 1 ELSE NULL END) AS cointwittersentiment_count_positive,
        COUNT(CASE WHEN (( cointwittersentiment.sentiment  ) = 'neutral') THEN 1 ELSE NULL END) AS cointwittersentiment_count_neutral,
        COUNT(CASE WHEN (( cointwittersentiment.sentiment  ) = 'negative') THEN 1 ELSE NULL END) AS cointwittersentiment_count_negative
    FROM `web3-da-ai-looker.off_chain_data_web3_looker_updated.coin-twitter-sentiment`  AS cointwittersentiment
    GROUP BY
        1
    ORDER BY
        2 DESC
    LIMIT 500 ;;
  }


  dimension: coin {
    primary_key: yes
    type: string
    sql: ${TABLE}.cointwittersentiment_coin ;;
  }

  dimension: count {
    type: number
    sql: ${TABLE}.cointwittersentiment_count ;;
  }

  dimension: count_positive {
    type: number
    sql: ${TABLE}.cointwittersentiment_count_positive ;;
  }

  dimension: count_neutral {
    type: number
    sql: ${TABLE}.cointwittersentiment_count_neutral ;;
  }

  dimension: count_negative {
    type: number
    sql: ${TABLE}.cointwittersentiment_count_negative ;;
  }

  set: detail {
    fields: [
      coin,
      count,
      count_positive,
      count_neutral,
      count_negative
    ]
  }
}
