#1.1
#When you type in the command ggplot(tweetsPerState, aes(x = n)) why doesn’t anything show up?
#Because you have to mention someting of what sort of data you will make such as geom_box

#1.2
#The aes() is to add aesthetics in the data chart. Such as fill=cut, color = cut


#1.3
#The differenc between fill and color is that fill is to actually fill up the color of the graph (bars, and lines)
#The color only colors the layer which is the outter part of the graph.

#1.4
#They are different in the way of geom_plots. They both contain their default values

#2.1
tweets %>%
  group_by(user_id) %>%
  arrange(date, time) %>%
  filter(row_number() == n()) %>%

ggplot(aes(x = log(followers))) + geom_histogram()

#2.2

tweets %>%
  filter(country == 'US') %>%
  mutate(hour = floor_date(as.POSIXct(date) + time, unit = 'hour'),
         locationType = ifelse(str_detect(place, '[A-Z][A-Z]'), 'city',
         ifelse(str_detect(place, 'USA'), 'state', 'other')),
  state = ifelse(locationType == 'city', str_sub(place, -2,-1), 
        ifelse(locationType == 'state', str_sub(place, 1, -6), NA)))

#3 
library(quantmod)
library(dplyr)
library(lubridate)
library(tidyr)
library(stringr)
library(ggplot2)

start <- as.Date('2014-01-01')
end   <- as.Date('2019-02-21')
getSymbols(c('AAPL', 'AMZN', 'FB', 'GOOG', 'MSFT', 'NFLX'), 
           from = start, to = end, return.class = 'data.frame')

stocks <- bind_cols(AAPL, AMZN, FB, GOOG, MSFT, NFLX) %>%
  mutate(date = as.Date(rownames(AAPL)))
rm(AAPL, AMZN, FB, GOOG, MSFT, NFLX)

stocks %>%
  gather(key = 'key', value = 'value', -date) %>%
  separate(key, into = c("stock", "type")) %>%
  spread(key = type, value = value) -> stocksTidy

#It was a little tricky and I couldn't see problems with the chart.
#So I had to look at the answers and practice.

#what does the function first() do?

stocksTidy%>%
  group_by(stock)%>%
  arrange(date)%>%
  mutate(Close=Close/first(Close))%>%
  ggplot(aes(x = date, y = Close, color = stock)) +geom_line() +scale_x_date(date_breaks = "3 months") +theme(axis.text.x = element_text(angle = -45, hjust = 0))

#4.1
library(datasets)
state_df <- data.frame(state.name, state.abb, state.region, stringsAsFactors = F)

tweets %>%
  filter(country == "US") %>%
  mutate(hour = floor_date(as.POSIXct(date) + time, unit = "hour"),
         locationType = ifelse(str_detect(place, ", [A-Z][A-Z]$"), "city", 
                               ifelse(str_detect(place, ", USA$"), "state", "other")),
         state = ifelse(locationType == "city", str_sub(place, -2, -1), 
                        ifelse(locationType == "state", str_sub(place, 1, -6), NA))) %>%
  left_join(state_df, by = c("state" = "state.abb")) %>%
  mutate(state = ifelse(locationType == "city", state.name, state)) %>%
  group_by(state, hour) %>%
  summarize(n = n()) %>%
  left_join(state_df, by = c("state" = "state.name")) %>%
  group_by(state.region, hour) %>%
  summarize(n_tweets = sum(n)) %>%
  filter(!is.na(state.region)) %>%
  ggplot(aes(x = hour, y = n_tweets, color = state.region)) + 
  geom_line(size = 1) 



dataa <- tweets %>%
  group_by(user_id) %>%
  summarize(sum = n())


#5 decision tree is one of the data structures in computer science. 
#Theres a lot of type of decision trees but the most basic one is the 
#one that has a random value oon top and compare the next value to place
#it on the right or left. Normally, if its bigger than the number than the top one, 
#place it on the right and if its smaller then we place it on the left. 





