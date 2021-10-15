#problem 1
#problem2
#filter out non US countries

library(datasets)
state_df <- data.frame(state.name, state.abb, state.region, stringsAsFactors = F)


tweets %>%
  filter(country == "US") %>%
  mutate(locationType = ifelse(str_detect(place, "[A-Z][A-Z]$"), "city", 
                               ifelse(str_detect(place, "USA$"), "country",NA)),
         state = ifelse(locationType == "city", str_sub(place, -2, -1), 
                        ifelse(locationType == "state", str_sub(place, 1, -6), NA))) %>%
  left_join(state_df, by = c("state" = "state.abb")) %>%
  mutate(state = ifelse(locationType == "city", state.name, state)) %>%
  group_by(state) %>%
  summarize(n = n()) -> tweetsPerState

#problem3
#The difference between "Key" and "value" in gather and spread is that
#gather - gathers up data forming a column in a given range of columns, the column is made andthe original columsn become the key which the following values match the keys
#spread - spreads the data into the columns giving key and value based on the given columns

#problem4
#gather - gather up all the elements
library(quantmod)
library(dplyr)
library(tidyr)
library(ggplot2)

library(quantmod)
library(dplyr)
library(tidyr)
library(ggplot2)

start <- as.Date('2014-01-01')
end   <- as.Date('2017-12-31')
getSymbols(c('AAPL', 'AMZN', 'FB', 'GOOG', 'MSFT', 'NFLX'), 
           from = start, to = end, return.class = 'data.frame')

stocks <- bind_cols(AAPL, AMZN, FB, GOOG, MSFT, NFLX) %>%
  mutate(date = as.Date(rownames(AAPL)))
rm(AAPL, AMZN, FB, GOOG, MSFT, NFLX)

stockslLong <- stocks %>%
  gather(key = 'key', value = 'value', -date) %>%
  separate(key, into = c("stock", "type")) %>%
  arrange(date, stock) 
head(stocksLong)

stock2 <- stocksLong %>%
  spread(key = type, value = value) %>%
  arrange(date, stock) %>%
head(stock2)
