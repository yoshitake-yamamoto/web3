# Define the database connection to be used for this model.
connection: "bq_ai_web3"

# include all the views
include: "/views/**/*.view.lkml"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

datagroup: web3_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: web3_default_datagroup

explore: coin_sentiment_fact {}

explore: cointwittersentiment {}

explore: meme_koins_token_transfer_analytics_2 {
  # join: coin_sentiment_fact {
  #   relationship: many_to_one
  #   sql_on: ${meme_koins_token_transfer_analytics_2.symbol} = ${coin_sentiment_fact.coin} ;;
  # }

  join: cointwittersentiment {
    relationship: many_to_many
    sql_on: ${meme_koins_token_transfer_analytics_2.symbol} = ${cointwittersentiment.coin} ;;
  }
}
