plot(iris$Sepal.Width, iris$Sepal.Length)

g <- ggplot(data = mpg, aes(x = displ, y= hwy))
g

g + geom_point() + geom_smooth(method = "lm")

g + geom_point(aes(color = class))

g + geom_point(aes(size = class))

g + geom_point() + facet_grid(. ~ cyl)
g + geom_point() + facet_grid(drv ~ .)
g + geom_point() + facet_grid(drv ~ cyl)
g + geom_point() + facet_wrap( ~ class)

g + geom_smooth()

g + geom_point() + geom_smooth(se = FALSE)

ggplot(data = mpg, aes(x = class, y = hwy)) + geom_point()

g <- ggplot(data = mpg, aes(x = reorder(class,hwy), y = hwy))
g + geom_boxplot()

g <- ggplot(data = mpg, aes(x = reorder(class, hwy,FUN = median), y = hwy))
g + geom_boxplot(aes())

ggplot(data = diamonds, aes(x = cut)) + geom_bar(aes(fill = cut))

ggplot(data = diamonds, aes(x = color)) + geom_bar(aes(fill = cut))

#1.1
ggplot(tweetsPerState, aes(x = n))
#The above code doesnt execute anything because it did not state what kind of graph it wants to display. 

#1.2
#the aes is for aesthetics which is the decoration or any specfici modification to add more details for the plot

#1.3
#fill is to fill in the colors inside the bar when the color is
#adding colors outside of the bar

#1.4 

#2.1
tweetssss <-tweets %>%
  mutate(locationType  = ifelse(str_detect(place, '[A-Z][A-Z]'), 'city',
                 ifelse(str_detect(place, 'USA'), 'country', NA)), 
         state  = ifelse(locationType == 'city', str_sub(place, -2,-1),
         ifelse(locationType == 'country', str_sub(place, 1,-6), NA))) %>%
  left_join(state_df, by = c('state' = 'state.abb')) %>%
  mutate(state = ifelse(locationType == 'city', state.name, state)) %>%
  group_by(state) %>%
  summarize(n = n())

tweets %>%
  mutate(locationType = ifelse(str_detect(placae, '[A-Z[A-Z'), 'city'))
  










