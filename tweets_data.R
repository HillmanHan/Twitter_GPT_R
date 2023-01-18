install.packages("rtweet")
install.packages("reactable")
install.packages("glue")
install.packages("stringr")
install.packages("httpuv")
install.packages("writexl")

library(rtweet)
library(dplyr)

tweet_df <- search_tweets("#chatgpt AND lang:en", n = 10000, include_rts = FALSE) #the query part functions like SQL, so I can use AND / OR

#tweet_df_user <- users_data(tweet_df) #This is an update in the rtweet 1.0.2. I need to use users_data to get the account information

names(tweet_df) #I may not need so many measures
      
tweets_gpt <- tweet_df %>%
      select(created_at, text, favorite_count, retweet_count)

library(reactable)
reactable::reactable(tweets_gpt) #This creates a reactable table for dataframe

library(writexl)
write_xlsx(tweets_gpt, "/Users/hillman/Desktop/TwitterGPT/Twitter_GPT_R/tweets_gpt_0117.xlsx")




