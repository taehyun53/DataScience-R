ggplot(data = diamonds, aes(x = color)) + 
  geom_bar(aes(fill = cut),position=position_fill(reverse=TRUE))

ggplot(data = diamonds, aes(x = color)) + 
  geom_bar(aes(fill = cut),position=position_stack(reverse=T))


g + geom_histogram(aes(fill = cut), binwidth = 0.2, position = position_stack(reverse = T)) + zoom