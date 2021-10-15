#first ggplot -scatterplot

?mpg
head(mpg)

g <- ggplot(data = mpg, aes(x = displ, y = hwy))

g + geom_point()


ggplot(mpg) + geom_point(aes(displ,hwy), color = "red")
ggplot(mpg,aes(displ,hwy,color = "red")) + geom_point()
ggplot(mpg, aes(displ, hwy), color = "red") + geom_point()

#after first break
#pg31
# the + sign is like the pipping in ggplot
g+ geom_point() + geom_smooth(method = "lm")
g+ geom_point() + geom_smooth(method = "lm", level = .99)

#pg37
g + geom_point(aes(color = class))

ggplot(mpg, aes(displ, hwy)) + geom_point(aes(color = "red"))

g + geom_point(aes(color = class, size = 5))

g + geom_point(aes(color = class), shape = 15)


#pg41 
g + geom_point() + facet_grid(. ~ cyl)
g + geom_point() + facet_grid( ~ cyl)
g + geom_point() + facet_grid(drv ~.)
g + geom_point() + facet_grid(drv ~cyl)
g + geom_point() + facet_grid(drv ~.)
g + geom_point() + facet_wrap(drv ~ cyl)

#more details in terms og geoms 
#pg 44
g+ geom_point() + geom_smooth(se = FALSE)

#pg 57
g <- ggplot(data = mpg, aes(x = class, y = hwy))
g + geom_boxplot()

g <- ggplot(data = mpg, aes(x = reorder(class, hwy), y = hwy))
g + geom_boxplot()

#the reason why we put median is to make the reorder function to consider reordering based on the median. If leaving the reorder with no median, it will automatically graph it based on the mean.
ggplot(data = mpg, aes(x = reorder(class, hwy, median), y = hwy)) + geom_boxplot()

#Diamond Dataset
ggplot(data = diamonds, aes(x = cut)) + geom_bar(aes(fill = cut))
ggplot(data = diamonds, aes(x = cut, y = price)) + geom_point()
ggplot(data= diamonds, aes(x = cut, fill = cut)) + geom_bar(aes(fill = cut)) + coord_flip()

#Position Adjustments
#pg72
ggplot(data = diamonds, aes(x = color)) + geom_bar(aes(fill=cut))
ggplot(data = diamonds, aes(x = color)) + geom_bar(aes(fill=cut), position = "fill")
ggplot(data = diamonds, aes(x = color)) + geom_bar(aes(fill = cut), position = position_fill(reverse = TRUE))
ggplot(data = diamonds, aes(x = color)) + geom_bar(aes(fill = cut), position = position_stack(reverse = TRUE))

ggplot(data = diamonds, aes(x = color)) + geom_bar(aes(fill = cut), position = "dodge")

set.seed(0)
ggplot(data = mpg, aes(x= cty, y = hwy)) + geom_point(position = "jitter")

g <- ggplot(data = diamonds, aes(x = carat))
g + geom_histogram()

#base R
hist(diamonds$carat, breaks = 0:10)
g + geom_histogram(binwidth = 0.5)
g + geom_histogram(binwidth = 0.1)
g + geom_histogram(binwidth = 1)

g + geom_histogram(bins = 0:10)

g <- ggplot(data = diamonds, aes(x = depth))
zoom <- coord_cartesian(xlim = c(55,70))

g + geom_histogram(aes(fill = cut), binwidth = 0.2, position = position_stack(reverse = TRUE)) + zoom

#comparing variables

g + geom_histogram(binwidth = 0.2) + facet_wrap(~cut) + zoom

g + geom_histogram(binwidth = 0.2) + geom_freqpoly(aes(color = cut), binwidth = 0.2)  + zoom


g <- ggplot(data = diamonds, aes(x = carat, y= price))
g + geom_point(aes(color = cut))

g + geom_density2d()

g + geom_bin2d(aes(color =cut)) + facet_grid(~cut)

g+ geom_bin2d(aes(color=cut)) + facet_wrap(~cut)

g + geom_point() + geom_density2d()

g + geom_density2d() + geom_point()

g + geom_smooth()

g + geom_smooth(aes(color = cut), method = "lm", se = FALSE)

#p118
g + geom_point(size = 0.5)
g + geom_point(alpha = 0.1)''

#customizing graphics in ggplot2

#customizing graphs
g <- ggplot(data = texas, aes(x = long, y = lat))
g + geom_point()

g + geom_polygon(aes(group = group))

#maps
counties = map_data("county")

ggplot(data = counties, aes(x = long, y = lat)) + geom_polygon(aes(group = group, fill = group))

g + geom_polygon(aes(group = group, fill = bin)) 

#get rid of NAS in texas
texas2 <- texas %>%
  filter(!is.na(bin))

g2 <- ggplot(data = texas2, aes(x = long, y = lat))

tx2 <- g2 + geom_polygon(aes(group = group, fill = bin))
tx2

tx2 + ggtitle("population of texas counties") + 
  theme(plot.title = element_text(hjust = 0.5))

tx2 + ggtitle("population of texas counties") + 
  theme(plot.title = element_text(hjust = 1))

#manipulating plots
g <- ggplot(data = diamonds, aes(x = caray, y = price)) + geom_point()
g
str(g)

g$coordinates

g2 <- g + coord_polar()

#pie chart
d2 <- subset(diamonds, color == "D")

cc <- ggplot(data = d2, aes(x = color)) + geom_bar(aes(fill = cut), position = "fill")
cc + coord_polar(theta = "y")
cc + coord_polar(theta = "y", start = 3.14)

#scales
ggplot(data = mpg, aes(x = displ, y= hwy)) + geom_point(aes(size = cyl))

last_plot() + scale_size_area()

#color
display.brewer.all()
tx2 + scale_fill_brewer(palette = "Greens")

#Theme
tx2+ theme_grey()

#labels

tx2 + ylab("Number of Diamonds")

#maps


