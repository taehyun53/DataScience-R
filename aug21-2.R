#p71
ggplot(data = diamonds,aes(x = cut)) + 
  geom_bar(aes(fill = cut))

ggplot(data = diamonds,aes(x = cut,y=price)) +geom_point()
ggplot(data = diamonds,aes(x = cut,fill=cut)) +geom_bar()

ggplot(data = diamonds,aes(x = cut,fill=cut)) +geom_bar() +
  coord_flip()

#poll
ggplot(diamonds,aes(x=cut),fill=cut) + geom_bar() # not same
ggplot(diamonds,aes(x=cut,fill=cut)) + geom_bar() # same


#p73
ggplot(data = diamonds, aes(x = color)) + 
  geom_bar(aes(fill = cut))

ggplot(data = diamonds, aes(x = color)) + 
  geom_bar(aes(fill = cut),position="fill")

ggplot(data = diamonds, aes(x = color)) + 
  geom_bar(aes(fill = cut),position=position_fill(reverse=TRUE))

ggplot(data = diamonds, aes(x = color)) + 
  geom_bar(aes(fill = cut),position=position_stack(reverse=T))

ggplot(data = diamonds, aes(x = color)) + 
  geom_bar(aes(fill = cut,position="fill")) #not same


#74
ggplot(data = diamonds, aes(x = color)) + 
  geom_bar(aes(fill = cut), position = "dodge")

#p75
ggplot(data = mpg, aes(x = cty, y = hwy)) + geom_point()

#p76
ggplot(data = mpg, aes(x = cty, y = hwy)) + 
  geom_point(position = "jitter")


set.seed(0)
ggplot(data = mpg, aes(x = cty, y = hwy)) + 
  geom_point(position = "jitter")

ggplot(data = mpg, aes(x = cty, y = hwy)) + geom_jitter()

#p85
g <- ggplot(data = diamonds, aes(x = carat))
g + geom_histogram(binwidth = 1)

# base R
hist(diamonds$carat)
hist(diamonds$carat,breaks = 0:10)

g + geom_histogram(binwidth = 0.5)
g + geom_histogram(binwidth = 0.1)
g + geom_histogram(binwidth = 1)
g + geom_histogram(bins = 10,breaks = 0:10)



#p89
g <- ggplot(data = diamonds, aes(x = depth))
zoom <- coord_cartesian(xlim = c(55, 70))
g + geom_histogram(binwidth = 0.2) + zoom

g + geom_histogram(aes(fill = cut), binwidth = 0.2) + zoom


g + geom_histogram(aes(fill = cut), binwidth = 0.2,position = position_stack(reverse=TRUE)) + zoom

g + geom_histogram(aes(fill = cut), binwidth = 0.2, position = position_stack(reverse = T)) + zoom

#p92
g <- ggplot( data = diamonds, aes(x = depth)) 
zoom <- coord_cartesian(xlim = c(55, 70))
g + geom_histogram(binwidth = 0.2) + facet_wrap( ~ cut) + zoom

#not same
g + geom_histogram(binwidth = 0.2) + facet_wrap( ~ cut) + zoom +
  geom_freqpoly(bindwidth=0.2)

# not same
g + geom_histogram(binwidth = 0.2) + facet_wrap( ~ cut)  +
  geom_freqpoly(bindwidth=0.2) + zoom

g + geom_histogram(aes(color=cut),binwidth = 0.2) + facet_wrap( ~ cut)  +
  geom_freqpoly(bindwidth=0.2) + zoom

# same
g + geom_histogram(binwidth = 0.2) + geom_freqpoly(binwidth=0.2) +
  facet_wrap( ~ cut) + zoom

g + geom_freqpoly(aes(color = cut), binwidth = 0.2) +
  facet_wrap(~cut) + zoom

#p96
g + geom_freqpoly(aes(color = cut), binwidth = 0.2) + zoom 


ggplot(data = diamonds, aes(x = price)) + 
  geom_histogram(binwidth = 500) + facet_wrap(~ cut)


ggplot(data = diamonds, aes(x = price)) + 
  geom_histogram(aes(fill = cut))


ggplot(data = diamonds, aes(x = price)) + 
  geom_freqpoly(aes(color = cut), binwidth = 500)

#p102
ggplot(data = diamonds, aes(x = price)) + geom_density(aes(color =cut))

#p105
g <- ggplot(data = diamonds, aes(x = carat, y = price)) 
g + geom_point(aes(color = cut))


#p107
g + geom_bin2d()
g + geom_bin2d( aes(color=cut))
g + geom_bin2d( aes(fill=cut))
g + geom_bin2d( aes(color=cut)) + facet_grid(~cut)
g + geom_bin2d( aes(fill=cut)) + facet_wrap(~cut)

g + geom_density2d()


g + geom_point() + geom_density2d()
g + geom_density2d() + geom_point()

g + geom_smooth()

#p118
g + geom_point(size = 0.5)
g + geom_point(alpha = 0.1)


#p7
g <- ggplot(data = texas, aes(x = long, y = lat))
g + geom_point()


#p8
g + geom_polygon(aes(group = group))
g + geom_polygon(aes(fill = group)) # not same


# p10
texas2 = texas[sample(nrow(texas)), ] 

ggplot(data = texas2, aes(x = long, y = lat)) + 
  geom_polygon(aes(group=group))

texas3 <- texas2 %>% arrange(order)
ggplot(data = texas3, aes(x = long, y = lat)) + 
  geom_polygon(aes(group=group))

#p11
library(maps)
counties = map_data("county") 

ggplot(data = counties, aes(x = long, y = lat)) + 
  geom_polygon(aes(group = group, fill = group))

#p13
tx <- g + geom_polygon(aes(group = group, fill = bin))
tx

texas2 <- texas %>% filter( !is.na(bin) )
g2 <- ggplot(texas2,aes(x=long,y=lat))
tx2 <- g2 + geom_polygon(aes(group = group, fill = bin))

#p19
tx + ggtitle("Population of Texas Counties") + 
  theme(plot.title = element_text(hjust = 0.5))

#poll
tx + ggtitle("Population of Texas Counties") + 
  theme(plot.title = element_text(hjust = 1))


# p23
g <- ggplot(data = diamonds, aes(x = carat, y = price)) + 
  geom_point()
str(g)

g$coordinates

#p29
g2 <- g + coord_polar()

#p32
g + coord_fixed(ratio = 1/10000)

tx + coord_map(projection = "gall", paramaters=1)

#p39
d2 <- subset(diamonds, color ==  "D")
cc <- ggplot(data = d2, aes(x =   color)) +
  geom_bar(aes(fill =  cut), position = "fill")
cc

cc + coord_polar(theta = 'y')
cc + coord_polar(theta = 'y', start = 3.14)

#p44
ggplot(data = mpg, aes(x =   displ, y = hwy)) + 
  geom_point(aes(color = cty))

last_plot() + scale_color_gradient(low="yellow",high = "red")

#p45
ggplot(data = mpg, aes(x =  displ, y = hwy)) + 
  geom_point(aes(size = cyl))

last_plot() + scale_size_area()
last_plot() + scale_size(range=c(1,10))

#p61
tx + theme(panel.border = 
             element_rect(colour = "black", 
                          fill = NA))

tx + xlab("x zxis")

#p77
tx + scale_fill_brewer(palette = "Blues") +
  xlab("") +
  ylab("") +
  theme_bw() +
  coord_map() +
  ggtitle("Population of Texas Counties") + 
  theme(plot.title = element_text(hjust=0.5))

#p81
q <- ggplot(data = mpg, aes(x = 
                              displ, y = hwy)) + 
  geom_point(aes(color = cty))

q + theme(legend.position = "bottom")

#p89
tx + scale_fill_grey(name = 
                       "Legend")

tx + labs(fill="another way")

tx + scale_fill_grey(name = 
                       "Legend", labels = c("label 1", 
                                            "label 2", 
                                            "label 3",
                                            "label 4", 
                                            "label 5"))

#p93
tx + scale_fill_brewer(
  palette = "Blues",
  name = "Population",
  labels = c("0 - 999", "1,000 - 9,999",
             "10,000 - 99,999", "100,000 - 999,999",
             "1,000,000+")) +
  xlab("") +
  ylab("") +
  theme_bw() +
  coord_map() +
  ggtitle("Population of Texas Counties")

tx2 + scale_fill_brewer(
  palette = "Blues",
  name = "Population",
  labels = c("0 - 999", "1,000 - 9,999",
             "10,000 - 99,999", "100,000 - 999,999",
             "1,000,000+")) +
  xlab("") +
  ylab("") +
  theme_bw() +
  coord_map() +
  ggtitle("Population of Texas Counties")



tx2 + scale_fill_brewer(
  palette = "Blues",
  name = "Population",
  labels = c("0 - 999", "1,000 - 9,999",
             "10,000 - 99,999", "100,000 - 999,999",
             "1,000,000+")) +
  xlab("") +
  ylab("") +
  theme_bw() +
  coord_map() +
  ggtitle("Population of Texas Counties") +
  geom_text(aes(x=-100,y=30),label="dallas")

#p127
world <- map_data("world")
naples <- ggplot(world, aes(x=long, y=lat, group=group) ) +
  geom_path(color='gray10', size=0.3) +
  geom_point(x=-81, y=26, size=10, shape='*') +
  scale_y_continuous(breaks=(-2:2) * 30) +
  scale_x_continuous(breaks=(-4:4) * 45) +
  coord_map("ortho", orientation=c(26, -80, 0))+
  theme(panel.grid.major = element_line(colour = "gray50"),
        panel.background = element_rect(fill = "white"),
        axis.text=element_blank(),
        axis.ticks=element_blank(),
        axis.title=element_blank() ) +
  ggtitle("Naples, Florida")
